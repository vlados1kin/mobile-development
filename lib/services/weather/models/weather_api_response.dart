// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'weather_api_response.g.dart';

/// Модель ответа от WeatherApi
@JsonSerializable(explicitToJson: true)
class WeatherApiResponse {
  /// Конструктор
  WeatherApiResponse({
    required this.location,
    required this.current,
    required this.forecast,
    required this.alerts,
  });

  /// Конструктор, создаёт объект из json'а
  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);

  /// Информация о локации
  final Location location;

  /// Информация о погоде сегодня
  final Current current;

  /// Прогноз погоды на ближайшие 1..14 дней
  final Forecast forecast;

  /// Информация о предупреждениях
  final Alerts alerts;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);
}

/// Модель информации о локации
@JsonSerializable()
class Location {
  /// Конструктор
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  /// Конструктор, создаёт объект из json'а
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// Название наслённого пункта
  final String name;

  /// Название региона
  final String region;

  /// Название странцы
  final String country;

  /// Широта населённого пункта
  final double lat;

  /// Долгота населённого пунка
  final double lon;

  /// Часовой пояс населённого пункта
  @JsonKey(name: 'tz_id')
  final String tzId;

  /// Местное время в формате timestamp
  @JsonKey(name: 'localtime_epoch')
  final int localtimeEpoch;

  /// Местное время в формате YYYY-MM-DD HH:MM
  final String localtime;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// Модель информации о погоде сегодня
@JsonSerializable(explicitToJson: true)
class Current {
  /// Конструктор
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  /// Конструктор, создаёт объект из json'а
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  /// Время последнего обновления в формате timestamp
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;

  /// Время последнего обновления в формате "yyyy-MM-dd HH:MM"
  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  /// Средняя температура в градусах Цельсия
  @JsonKey(name: 'temp_c')
  final double tempC;

  /// Средняя температура в градусах Фаренгейта
  @JsonKey(name: 'temp_f')
  final double tempF;

  /// Флаг дня
  @JsonKey(name: 'is_day')
  final int isDay;

  /// Информация о погоде
  final Condition condition;

  /// Скорость ветра в милях в секунду
  @JsonKey(name: 'wind_mph')
  final double windMph;

  /// Скорость ветра в километрах в час
  @JsonKey(name: 'wind_kph')
  final double windKph;

  /// Направление ветра в градусах
  @JsonKey(name: 'wind_degree')
  final int windDegree;

  /// Направление ветра в текстовом формате
  @JsonKey(name: 'wind_dir')
  final String windDir;

  /// Давление в паскалях
  @JsonKey(name: 'pressure_mb')
  final int pressureMb;

  /// Давление в дюймах ртутного столба
  @JsonKey(name: 'pressure_in')
  final double pressureIn;

  /// Количество осадков в миллиметрах
  @JsonKey(name: 'precip_mm')
  final double precipMm;

  /// Количество осадков в дюймах
  @JsonKey(name: 'precip_in')
  final double precipIn;

  /// Влажность в процентах
  final int humidity;

  /// Облачность в процентах
  final int cloud;

  /// Температура ощущается как в градусах Цельсия
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;

  /// Температура ощущается как в градусах Фаренгейта
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;

  /// Температура ветра в градусах Цельсия
  @JsonKey(name: 'windchill_c')
  final double windchillC;

  /// Температура ветра в градусах Фаренгейта
  @JsonKey(name: 'windchill_f')
  final double windchillF;

  /// Индекс жары в градусах Цельсия
  @JsonKey(name: 'heatindex_c')
  final double heatindexC;

  /// Индекс жары в градусах Фаренгейта
  @JsonKey(name: 'heatindex_f')
  final double heatindexF;

  /// Температура точки росы в градусах Цельсия
  @JsonKey(name: 'dewpoint_c')
  final double dewpointC;

  /// Температура точки росы в градусах Фаренгейта
  @JsonKey(name: 'dewpoint_f')
  final double dewpointF;

  /// Видимость в километрах
  @JsonKey(name: 'vis_km')
  final double visKm;

  /// Видимость в милях
  @JsonKey(name: 'vis_miles')
  final double visMiles;

  /// Уровень ультрафиолетового излучения
  final double uv;

  /// Скорость порывов ветра в милях в секунду
  @JsonKey(name: 'gust_mph')
  final double gustMph;

  /// Скорость порывов ветра в километрах в час
  @JsonKey(name: 'gust_kph')
  final double gustKph;

  /// Информация о качестве воздуха
  @JsonKey(name: 'air_quality')
  final AirQuality airQuality;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

/// Модель информации о погоде
@JsonSerializable()
class Condition {
  /// Конструктор
  Condition({required this.text, required this.icon, required this.code});

  /// Конструктор, создаёт объект из json'а
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  /// Описание состояния погоды
  final String text;

  /// Иконка состояния погоды
  final String icon;

  /// Код состояния погоды
  final int code;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

/// Модель информации о качестве воздуха
@JsonSerializable()
class AirQuality {
  /// Конструктор
  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  /// Конструктор, создаёт объект из json'а
  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  /// Концентрация угарного газа
  final double? co;

  /// Концентрация диоксида азота
  final double? no2;

  /// Концентрация озона
  final double? o3;

  /// Концентрация диоксида серы
  final double? so2;

  /// Концентрация частиц PM2.5
  @JsonKey(name: 'pm2_5')
  final double? pm25;

  /// Концентрация частиц PM10
  final double? pm10;

  /// Индекс качества воздуха по версии EPA
  @JsonKey(name: 'us-epa-index')
  final int? usEpaIndex;

  /// Индекс качества воздуха по версии DEFRA
  @JsonKey(name: 'gb-defra-index')
  final int? gbDefraIndex;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$AirQualityToJson(this);
}

/// Модель информации о прогнозе погоды
@JsonSerializable(explicitToJson: true)
class Forecast {
  /// Конструктор
  Forecast({required this.forecastday});

  /// Конструктор, создаёт объект из json'а
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  /// Прогноз погоды на ближайшие 1..14 дней
  final List<ForecastDay> forecastday;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

/// Модель информации о прогнозе погоды на конкретный день
@JsonSerializable(explicitToJson: true)
class ForecastDay {
  /// Конструктор
  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  /// Конструктор, создаёт объект из json'а
  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  /// Дата прогноза в формате YYYY-MM-DD
  final String date;

  /// Дата прогноза в формате timestamp
  @JsonKey(name: 'date_epoch')
  final int dateEpoch;

  /// Информация о погоде в этот день
  final Day day;

  /// Информация о восходе и закате
  final Astro astro;

  /// Прогноз погоды по часам
  final List<Hour> hour;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

/// Модель информации о погоде в этот день
@JsonSerializable()
class Day {
  /// Конструктор
  Day({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.totalSnowCm,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
    required this.airQuality,
  });

  /// Конструктор, создаёт объект из json'а
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  /// Максимальная температура в градусах Цельсия
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;

  /// Максимальная температура в градусах Фаренгейта
  @JsonKey(name: 'maxtemp_f')
  final double maxTempF;

  /// Минимальная температура в градусах Цельсия
  @JsonKey(name: 'mintemp_c')
  final double minTempC;

  /// Минимальная температура в градусах Фаренгейта
  @JsonKey(name: 'mintemp_f')
  final double minTempF;

  /// Средняя температура в градусах Цельсия
  @JsonKey(name: 'avgtemp_c')
  final double avgTempC;

  /// Средняя температура в градусах Фаренгейта
  @JsonKey(name: 'avgtemp_f')
  final double avgTempF;

  /// Максимальная скорость ветра в милях в секунду
  @JsonKey(name: 'maxwind_mph')
  final double maxWindMph;

  /// Максимальная скорость ветра в километрах в час
  @JsonKey(name: 'maxwind_kph')
  final double maxWindKph;

  /// Общее количество осадков в миллиметрах
  @JsonKey(name: 'totalprecip_mm')
  final double totalPrecipMm;

  /// Общее количество осадков в дюймах
  @JsonKey(name: 'totalprecip_in')
  final double totalPrecipIn;

  /// Общее количество снега в сантиметрах
  @JsonKey(name: 'totalsnow_cm')
  final double totalSnowCm;

  /// Средняя видимость в километрах
  @JsonKey(name: 'avgvis_km')
  final double avgVisKm;

  /// Средняя видимость в милях
  @JsonKey(name: 'avgvis_miles')
  final double avgVisMiles;

  /// Средняя влажность в процентах
  final int avghumidity;

  /// Флаг дождя
  final int? dailyWillItRain;

  /// Вероятность дождя в процентах
  final int? dailyChanceOfRain;

  /// Флаг снега
  final int? dailyWillItSnow;

  /// Вероятность снега в процентах
  final int? dailyChanceOfSnow;

  /// Информация о погоде
  final Condition condition;

  /// Уровень ультрафиолетового излучения
  final double uv;

  /// Информация о качестве воздуха
  @JsonKey(name: 'air_quality')
  final AirQuality airQuality;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$DayToJson(this);
}

/// Модель информации о восходе и закате
@JsonSerializable()
class Astro {
  /// Конструктор
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  /// Конструктор, создаёт объект из json'а
  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  /// Время восхода солнца в формате "HH:MM"
  final String sunrise;

  /// Время заката солнца в формате "HH:MM"
  final String sunset;

  /// Время восхода луны в формате "HH:MM"
  final String moonrise;

  /// Время заката луны в формате "HH:MM"
  final String moonset;

  /// Фаза луны
  @JsonKey(name: 'moon_phase')
  final String moonPhase;

  /// Освещённость луны в процентах
  @JsonKey(name: 'moon_illumination')
  final int moonIllumination;

  /// Флаг восхода луны
  @JsonKey(name: 'is_moon_up')
  final int isMoonUp;

  /// Флаг восхода солнца
  @JsonKey(name: 'is_sun_up')
  final int isSunUp;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$AstroToJson(this);
}

/// Модель информации о прогнозе погоды по часам
@JsonSerializable()
class Hour {
  /// Конструктор
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.airQuality,
  });

  /// Конструктор, создаёт объект из json'а
  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  /// Время прогноза в формате timestamp
  @JsonKey(name: 'time_epoch')
  final int timeEpoch;

  /// Время прогноза в формате "yyyy-MM-dd HH:MM"
  final String time;

  /// Средняя температура в градусах Цельсия
  @JsonKey(name: 'temp_c')
  final double tempC;

  /// Средняя температура в градусах Фаренгейта
  @JsonKey(name: 'temp_f')
  final double tempF;

  /// Флаг дня
  @JsonKey(name: 'is_day')
  final int isDay;

  /// Информация о погоде
  final Condition condition;

  /// Скорость ветра в милях в секунду
  @JsonKey(name: 'wind_mph')
  final double windMph;

  /// Скорость ветра в километрах в час
  @JsonKey(name: 'wind_kph')
  final double windKph;

  /// Направление ветра в градусах
  @JsonKey(name: 'wind_degree')
  final int windDegree;

  /// Направление ветра в текстовом формате
  @JsonKey(name: 'wind_dir')
  final String windDir;

  /// Давление в паскалях
  @JsonKey(name: 'pressure_mb')
  final int pressureMb;

  /// Давление в дюймах ртутного столба
  @JsonKey(name: 'pressure_in')
  final double pressureIn;

  /// Количество осадков в миллиметрах
  @JsonKey(name: 'precip_mm')
  final double precipMm;

  /// Количество осадков в дюймах
  @JsonKey(name: 'precip_in')
  final double precipIn;

  /// Количество снега в сантиметрах
  @JsonKey(name: 'snow_cm')
  final double snowCm;

  /// Влажность в процентах
  final int humidity;

  /// Облачность в процентах
  final int cloud;

  /// Температура ощущается как в градусах Цельсия
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;

  /// Температура ощущается как в градусах Фаренгейта
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;

  /// Температура ветра в градусах Цельсия
  @JsonKey(name: 'windchill_c')
  final double windchillC;

  /// Температура ветра в градусах Фаренгейта
  @JsonKey(name: 'windchill_f')
  final double windchillF;

  /// Индекс жары в градусах Цельсия
  @JsonKey(name: 'heatindex_c')
  final double heatindexC;

  /// Индекс жары в градусах Фаренгейта
  @JsonKey(name: 'heatindex_f')
  final double heatindexF;

  /// Температура точки росы в градусах Цельсия
  @JsonKey(name: 'dewpoint_c')
  final double dewpointC;

  /// Температура точки росы в градусах Фаренгейта
  @JsonKey(name: 'dewpoint_f')
  final double dewpointF;

  /// Флаг дождя
  final int? willItRain;

  /// Вероятность дождя в процентах
  final int? chanceOfRain;

  /// Флаг снега
  final int? willItSnow;

  /// Вероятность снега в процентах
  final int? chanceOfSnow;

  /// Видимость в километрах
  @JsonKey(name: 'vis_km')
  final double visKm;

  /// Видимость в милях
  @JsonKey(name: 'vis_miles')
  final double visMiles;

  /// Скорость порывов ветра в милях в секунду
  @JsonKey(name: 'gust_mph')
  final double gustMph;

  /// Скорость порывов ветра в километрах в час
  @JsonKey(name: 'gust_kph')
  final double gustKph;

  /// Уровень ультрафиолетового излучения
  final double uv;

  /// Информация о качестве воздуха
  @JsonKey(name: 'air_quality')
  final AirQuality airQuality;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$HourToJson(this);
}

/// Модель информации о предупреждениях
@JsonSerializable()
class Alerts {
  /// Конструктор
  Alerts({required this.alert});

  /// Конструктор, создаёт объект из json'а
  factory Alerts.fromJson(Map<String, dynamic> json) => _$AlertsFromJson(json);

  /// Информация о предупреждениях
  final List<Alert> alert;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$AlertsToJson(this);
}

/// Модель информации о предупреждении
@JsonSerializable()
class Alert {
  /// Конструктор
  Alert({
    required this.headline,
    required this.effective,
    required this.expires,
    required this.event,
    required this.desc,
  });

  /// Конструктор, создаёт объект из json'а
  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  /// Заголовок предупреждения
  final String headline;

  /// Время начала действия предупреждения в формате yyyy-MM-ddThh:mm:ss
  final String effective;

  /// Время окончания действия предупреждения в формате yyyy-MM-ddThh:mm:ss
  final String expires;

  /// Тип предупреждения
  final String event;

  /// Описание предупреждения
  final String desc;

  /// Преобразование объекта в json
  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
