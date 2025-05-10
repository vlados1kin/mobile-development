// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:weather_app/features/location/data/data.dart';
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_now/data/weather_info.dart';
import 'package:weather_app/services/weather/weather.dart';

/// Провайдер для получения и хранения данных о погоде и загрязнении воздуха.
class WeatherProvider extends ChangeNotifier {
  /// Коснтруктор класса
  WeatherProvider({
    required WeatherService service,
    required LocationService locationService,
  }) : _weatherService = service,
       _locationService = locationService;

  /// Сервис получения данных о погоде
  final WeatherService _weatherService;

  /// Сервис получения данных о местоположении
  final LocationService _locationService;

  /// Флаг загрузки данных
  bool isLoading = false;

  /// Текст сообщения ошибки загрузки данных
  String? error;

  /// Основная инфмаорция о погоде
  MainWeatherData? mainWeather;

  /// Прогноз погоды
  Map<WeatherData, List<WeatherData>> forecast = {};

  /// Общий индекс загрязнения воздуха
  int? defraIndex;

  /// Список данных о загрязнении воздуха
  List<PollutionData> pollutionList = [];

  /// Список данных о чрезвычайных ситуациях
  List<WeatherAlertData> alertList = [];

  /// Данные о текущем местоположении
  LocationData? currentLocation;

  /// Возвращает самое популярное направление воздуха из списка
  String _getMostPopularWindDirection({required List<Hour> data}) {
    final inputs = data.map((e) => e.windDir).toList();

    final counts = <String, int>{};
    for (final item in inputs) {
      counts[item] = (counts[item] ?? 0) + 1;
    }

    var mostFrequent = counts.keys.first;
    var maxCount = counts[mostFrequent]!;
    counts.forEach((key, value) {
      if (value > maxCount) {
        mostFrequent = key;
        maxCount = value;
      }
    });

    return mostFrequent;
  }

  /// Конвертирует иконки из WeatherApi формата в OpenWeatherApi
  String _mapWeatherApiIconToOpenWeather(String weatherApiIconUrl) {
    final regex = RegExp(r'/(day|night)/(\d+)\.png');
    final match = regex.firstMatch(weatherApiIconUrl);

    if (match == null) return '01d';

    final isDay = match.group(1) == 'day';
    final code = match.group(2);

    const iconMap = {
      '113': ['01d', '01n'], // Sunny / Clear
      '116': ['02d', '02n'], // Partly cloudy
      '119': ['03d', '03n'], // Cloudy
      '122': ['04d', '04n'], // Overcast
      '143': ['50d', '50n'], // Mist
      '176': ['09d', '09n'], // Patchy rain possible
      '179': ['13d', '13n'], // Patchy snow possible
      '182': ['13d', '13n'], // Patchy sleet possible
      '185': ['09d', '09n'], // Patchy freezing drizzle possible
      '200': ['11d', '11n'], // Thunder possible
    };

    final mapped = iconMap[code];
    if (mapped == null) return '01d';

    return isDay ? mapped[0] : mapped[1];
  }

  /// Возвращает заголовок для даты на основе разницы с текущим днём
  String _getTitle(String date) {
    final today = DateTime.now();
    final todayComparable = DateTime(today.year, today.month, today.day);
    final weatherDate = DateTime.parse(date);
    final comparableWeatherDate = DateTime(
      weatherDate.year,
      weatherDate.month,
      weatherDate.day,
    );
    final difference = comparableWeatherDate.difference(todayComparable).inDays;

    return switch (difference) {
      0 => 'Сегодня',
      1 => 'Завтра',
      2 => 'Послезавтра',
      3 => 'Через 3 дня',
      4 => 'Через 4 дня',
      5 => 'Через 5 дней',
      6 => 'Через 6 дней',
      7 => 'Через 7 дней',
      8 => 'Через 8 дней',
      _ => 'Не ну стену не ломай, у нас на 5 дней прогноз',
    };
  }

  /// Возвращает день недели и дату в формате "Пн 01.01"
  String _getDay(String date) {
    final weatherDate = DateTime.parse(date);

    final weekDay = switch (weatherDate.weekday) {
      1 => 'Пн',
      2 => 'Вт',
      3 => 'Ср',
      4 => 'Чт',
      5 => 'Пт',
      6 => 'Сб',
      7 => 'Вс',
      _ => 'Ну нихуя себе день',
    };

    final day =
        weatherDate.day < 10
            ? '0${weatherDate.day}'
            : weatherDate.day.toString();
    final month =
        weatherDate.month < 10
            ? '0${weatherDate.month}'
            : weatherDate.month.toString();

    return '$weekDay $day.$month';
  }

  /// Возвращает время в формате "yyyy-MM-dd HH:MM"
  String _getTime(String time) {
    final weatherDate = DateTime.parse(time);
    final hours = weatherDate.hour.toString().padLeft(2, '0');
    final minutes = weatherDate.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  /// Конвертирует даты из 12-часового формата в 24-часовой
  List<int> _convertTo24Hour(String time12h) {
    final regExp = RegExp(
      r'^(\d{1,2}):(\d{2})\s*(AM|PM)$',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(time12h.trim());

    if (match == null) {
      throw FormatException('Invalid time format: $time12h');
    }

    var hour = int.parse(match.group(1)!);
    final minute = int.parse(match.group(2)!);
    final meridian = match.group(3)!.toUpperCase();

    if (meridian == 'AM') {
      if (hour == 12) hour = 0;
    } else if (meridian == 'PM') {
      if (hour != 12) hour += 12;
    }

    return [hour, minute];
  }

  /// Инициализирует данные о погоде
  Future<void> init() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      currentLocation =
          await _locationService.getCurrentLocation() ??
          LocationData(country: 'Беларусь', city: 'Минск');

      await updateWeather();
    } catch (e) {
      error = e.toString();
      debugPrint(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Получение данных о погоде
  Future<void> updateWeather() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      forecast = {};
      pollutionList = [];
      alertList = [];

      final weather = await _weatherService.fetchWeather(
        city: currentLocation!.city,
      );
      final sunrise = _convertTo24Hour(
        weather.forecast.forecastday[0].astro.sunrise,
      );
      final sunset = _convertTo24Hour(
        weather.forecast.forecastday[0].astro.sunset,
      );

      mainWeather = MainWeatherData(
        temperatureC: weather.current.tempC.toInt(),
        temperatureF: weather.current.tempF.toInt(),
        temperatureK: (weather.current.tempC + 273.15).toInt(),
        feelsLikeC: weather.current.feelslikeC.toInt(),
        feelsLikeF: weather.current.feelslikeF.toInt(),
        feelsLikeK: (weather.current.feelslikeC + 273.15).toInt(),
        icon: _mapWeatherApiIconToOpenWeather(weather.current.condition.icon),
        humidity: weather.current.humidity,
        windM: weather.current.windKph / 3.6,
        windK: weather.current.windKph,
        pressureP: weather.current.pressureMb,
        pressureM: (weather.current.pressureIn * 25.4).toInt(),
        sunsetMinute: sunset[1],
        sunriseHour: sunrise[0],
        sunriseMinute: sunrise[1],
        sunsetHour: sunset[0],
        gustM: weather.current.gustKph / 3.6,
        gustK: weather.current.gustKph,
        text: weather.current.condition.text,
        lastUpdate: DateTime.parse(weather.current.lastUpdated),
      );

      defraIndex = weather.current.airQuality.gbDefraIndex;
      pollutionList = [
        PollutionData(
          element: 'CO',
          description: 'Угарный газ',
          value: weather.current.airQuality.co!,
          level: Level.getCOLevel(weather.current.airQuality.co!),
        ),
        PollutionData(
          element: 'NO2',
          description: 'Диоксид озота',
          value: weather.current.airQuality.no2!,
          level: Level.getNO2Level(weather.current.airQuality.no2!),
        ),
        PollutionData(
          element: 'O3',
          description: 'Озон',
          value: weather.current.airQuality.o3!,
          level: Level.getO3Level(weather.current.airQuality.o3!),
        ),
        PollutionData(
          element: 'SO2',
          description: 'Диоксид серы',
          value: weather.current.airQuality.so2!,
          level: Level.getSO2Level(weather.current.airQuality.so2!),
        ),
        PollutionData(
          element: 'PM2.5',
          description: 'Мелкие твёрдые частицы',
          value: weather.current.airQuality.pm25!,
          level: Level.getPM25Level(weather.current.airQuality.pm25!),
        ),
        PollutionData(
          element: 'PM10',
          description: 'Крупные твёрдые частицы',
          value: weather.current.airQuality.pm10!,
          level: Level.getPM10Level(weather.current.airQuality.pm10!),
        ),
      ];

      for (final forecastDay in weather.forecast.forecastday) {
        final avgPressureP =
            forecastDay.hour.map((e) => e.pressureMb).toList().average;
        final avgPressureM =
            forecastDay.hour.map((e) => e.pressureIn * 25.4).toList().average;

        forecast[WeatherData(
              title: _getTitle(forecastDay.date),
              subtitle: _getDay(forecastDay.date),
              icon: _mapWeatherApiIconToOpenWeather(
                forecastDay.day.condition.icon,
              ),
              maxTemperatureC: forecastDay.day.maxTempC.toInt(),
              maxTemperatureF: forecastDay.day.maxTempF.toInt(),
              maxTemperatureK: (forecastDay.day.maxTempC + 273.15).toInt(),
              minTemperatureC: forecastDay.day.minTempC.toInt(),
              minTemperatureF: forecastDay.day.minTempF.toInt(),
              minTemperatureK: (forecastDay.day.minTempC + 273.15).toInt(),
              pressureP: avgPressureP.toInt(),
              pressureM: avgPressureM.toInt(),
              windM: forecastDay.day.maxWindKph / 3.6,
              windK: forecastDay.day.maxWindKph,
              windDir: _getMostPopularWindDirection(data: forecastDay.hour),
            )] =
            forecastDay.hour
                .map(
                  (e) => WeatherData(
                    title: _getTime(e.time),
                    icon: _mapWeatherApiIconToOpenWeather(e.condition.icon),
                    temperatureC: e.tempC.toInt(),
                    temperatureF: e.tempF.toInt(),
                    temperatureK: (e.tempC + 273.15).toInt(),
                    pressureP: e.pressureMb,
                    pressureM: (e.pressureIn * 25.4).toInt(),
                    windM: e.windKph / 3.6,
                    windK: e.windKph,
                    windDir: e.windDir,
                  ),
                )
                .toList();
      }

      alertList =
          weather.alerts.alert
              .where((e) => e.desc.isNotEmpty)
              .map(
                (e) => WeatherAlertData(
                  senderName: 'WeatherApi',
                  event: e.event,
                  start:
                      e.effective.isNotEmpty
                          ? DateTime.parse(e.effective)
                          : DateTime.now(),
                  end: DateTime.parse(e.expires),
                  description: e.desc,
                ),
              )
              .toList();
    } catch (e) {
      error = e.toString();
      debugPrint(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Поиск локации по названию
  Future<List<LocationData>> searchLocation({required String query}) async {
    try {
      final locations = await _locationService.searchLocation(query: query);
      return locations
          .map((e) => LocationData(country: e.country, city: e.name))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  /// Сохранение текущей локации
  Future<void> saveCurrentLocation(LocationData location) async {
    try {
      await _locationService.saveCurrentLocation(location);
      currentLocation = location;
      notifyListeners();

      await updateWeather();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
