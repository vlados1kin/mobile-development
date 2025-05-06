/// Класс для представления данных о текущей погоде.
class MainWeatherData {
  /// Конструктор для создания объекта с данными о погоде.
  MainWeatherData({
    required this.temperatureC,
    required this.temperatureF,
    required this.temperatureK,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.feelsLikeK,
    required this.icon,
    required this.humidity,
    required this.windM,
    required this.windK,
    required this.pressureP,
    required this.pressureM,
    required this.sunriseHour,
    required this.sunriseMinute,
    required this.sunsetHour,
    required this.sunsetMinute,
    required this.gustM,
    required this.gustK,
    required this.text,
    required this.lastUpdate,
  });

  /// Температура в градусах Цельсия.
  final int temperatureC;

  /// Температура в градусах Фаренгейта.
  final int temperatureF;

  /// Температура в Кельвинах.
  final int temperatureK;

  /// Ощущаемая температура в градусах Цельсия.
  final int feelsLikeC;

  /// Ощущаемая температура в градусах Фаренгейта.
  final int feelsLikeF;

  /// Ощущаемая температура в Кельвинах.
  final int feelsLikeK;

  /// Иконка, отображающая погодные условия.
  final String icon;

  /// Влажность воздуха в процентах.
  final int humidity;

  /// Скорость ветра в метрах в секунду.
  final double windM;

  /// Скорость ветра в километрах в час.
  final double windK;

  /// Атмосферное давление в паскалях.
  final int pressureP;

  /// Атмосферное давление в миллиметрах ртутного столба.
  final int pressureM;

  /// Час восхода солнца.
  final int sunriseHour;

  /// Минута восхода солнца.
  final int sunriseMinute;

  /// Час захода солнца.
  final int sunsetHour;

  /// Минута захода солнца.
  final int sunsetMinute;

  /// Порывы ветра в метрах в секунду.
  final double gustM;

  /// Порывы ветра в километрах в час.
  final double gustK;

  /// Описание погодных условий.
  final String text;

  /// Дата и время последнего обновления данных о погоде.
  final DateTime lastUpdate;
}
