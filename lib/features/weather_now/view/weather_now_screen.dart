import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_forecast/widgets/weather_list.dart';
import 'package:weather_app/features/weather_now/data/weather_info.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/services/settings/models/models.dart';
import 'package:weather_app/features/weather_alerts/widgets/weather_alert_list_elem.dart';
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
// Добавляем импорты для прогноза погоды

class WeatherNowScreen extends StatefulWidget {
  const WeatherNowScreen({super.key});

  @override
  State<WeatherNowScreen> createState() => _WeatherNowScreenState();
}

class _WeatherNowScreenState extends State<WeatherNowScreen> with TickerProviderStateMixin {
  bool _showExtra = false;
  bool _showAlerts = false;
  final bool _showForecast = false; // Новая переменная для управления видимостью прогноза

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (weatherProvider.isLoading) {
      return Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final data = weatherProvider.mainWeather!;
    final wind = settingsProvider.windSpeedUnit == WindSpeedUnit.mps
        ? data.windM
        : data.windK;
    final gust = settingsProvider.windSpeedUnit == WindSpeedUnit.mps
        ? data.gustM
        : data.gustK;
    final speedUnit =
    settingsProvider.windSpeedUnit == WindSpeedUnit.mps ? 'м/с' : 'км/ч';
    final pressure = settingsProvider.pressureUnit == PressureUnit.hpa
        ? data.pressureP
        : data.pressureM;
    final pressureUnit =
    settingsProvider.pressureUnit == PressureUnit.hpa ? 'гПа' : 'мм рт. ст.';
    final city = weatherProvider.currentLocation?.city ?? 'Город не найден';

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCityInfo(city, isDark),
              const SizedBox(height: 12),
              _buildWeatherInfo(data, isDark, data.text),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showExtra = !_showExtra;
                    });
                  },
                  icon: AnimatedRotation(
                    turns: _showExtra ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.expand_more),
                  ),
                  label: Text(
                    _showExtra ? 'Скрыть параметры' : 'Дополнительные параметры',
                    style: TextStyle(fontSize: 16, color: isDark ? Colors.white : Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                    foregroundColor: isDark ? Colors.white : Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _showExtra
                    ? _buildWeatherGrid(
                    data, wind, gust, speedUnit, pressure, pressureUnit, isDark,)
                    : const SizedBox.shrink(),
              ),
              // Weather Alerts Section
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showAlerts = !_showAlerts;
                    });
                  },
                  icon: AnimatedRotation(
                    turns: _showAlerts ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.notifications),
                  ),
                  label: Text(
                    _showAlerts ? 'Скрыть предупреждения' : 'Показать предупреждения',
                    style: TextStyle(fontSize: 16, color: isDark ? Colors.white : Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                    foregroundColor: isDark ? Colors.white : Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _showAlerts
                    ? _buildAlertList(weatherProvider.alertList, isDark)
                    : const SizedBox.shrink(),
              ),
              // Прогноз погоды на ближайшие дни
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[850] : Colors.white, // Изменяем фон в зависимости от темы
                    borderRadius: BorderRadius.circular(16), // Закругленные углы
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today, // Иконка календаря
                        color: isDark ? Colors.white : Colors.blue, // Изменяем цвет иконки в зависимости от темы
                      ),
                      const SizedBox(width: 8), // Отступ между иконкой и текстом
                      Text(
                        'Прогноз на неделю',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black, // Изменяем цвет текста в зависимости от темы
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: WeatherList(
                  weatherDataList: weatherProvider.forecast,
                  scrollController: ScrollController(),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityInfo(String city, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              city,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, NavigationRoutes.locationSearch);
              },
              icon: Icon(
                Icons.location_on,
                color: isDark ? Colors.white : Colors.black,
              ),
              label: Text(
                'Выбрать город',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(MainWeatherData data, bool isDark, String description) {
    final provider = Provider.of<SettingsProvider>(context);
    final temperature = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => data.temperatureC,
      TemperatureUnit.fahrenheit => data.temperatureF,
      TemperatureUnit.kelvin => data.temperatureK,
    };
    final temperatureSign = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => '°C',
      TemperatureUnit.fahrenheit => '°F',
      TemperatureUnit.kelvin => 'K',
    };
    final feelsLike = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => data.feelsLikeC,
      TemperatureUnit.fahrenheit => data.feelsLikeF,
      TemperatureUnit.kelvin => data.feelsLikeK,
    };

    final textColor = isDark ? Colors.white : Colors.blue;
    final theme = Theme.of(context);

    // Получаем текущую дату
    final currentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Надпись "Сегодня, дата" по центру и увеличенная
            Center(
              child: Text(
                'Сегодня, $currentDate',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16), // Отступ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Для иконки и текста
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$temperature',
                            style: theme.textTheme.displayLarge?.copyWith(color: textColor),
                          ),
                          Text(
                            temperatureSign,
                            style: theme.textTheme.displaySmall?.copyWith(color: textColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ощущается как $feelsLike$temperatureSign',
                        style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: theme.textTheme.bodySmall?.copyWith(color: textColor),
                      ),
                    ],
                  ),
                ),
                // Иконка погоды
                Image.asset(
                  'assets/images/png/${data.icon}.png',
                  width: 120,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherGrid(
      MainWeatherData data,
      double wind,
      double gust,
      String speedUnit,
      int pressure,
      String pressureUnit,
      bool isDark,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _paramCard('Влажность', '${data.humidity} %', isDark),
          const SizedBox(height: 12),
          _paramCard('Давление', '$pressure $pressureUnit', isDark),
          const SizedBox(height: 12),
          _paramCard('Ветер', '${wind.toStringAsFixed(1)} $speedUnit', isDark),
          const SizedBox(height: 12),
          _paramCard('Порывы', '${gust.toStringAsFixed(1)} $speedUnit', isDark),
          const SizedBox(height: 12),
          _paramCard('Рассвет', '${data.sunriseHour}ч ${data.sunriseMinute}м', isDark),
          const SizedBox(height: 12),
          _paramCard('Закат', '${data.sunsetHour}ч ${data.sunsetMinute}м', isDark),
        ],
      ),
    );
  }

  Widget _paramCard(String title, String value, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertList(List<WeatherAlertData> alertList, bool isDark) {
    if (alertList.isEmpty) {
      return Center(
        child: Text(
          'Нет доступных предупреждений',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Чтобы не конфликтовало с внешним ScrollView
      itemCount: alertList.length,
      itemBuilder: (context, index) {
        return WeatherAlertListElem(
          alertData: alertList[index],
          // Без onTap — перехода не будет
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}