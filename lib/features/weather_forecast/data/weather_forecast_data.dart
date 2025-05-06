/// Класс содержит основную информацию о сегодняшнем прогнозе
class WeatherData {
  /// Конструктор
  WeatherData({
    required this.title,
    required this.icon,
    required this.pressureP,
    required this.pressureM,
    required this.windM,
    required this.windK,
    required this.windDir,
    this.subtitle,
    this.temperatureC,
    this.temperatureF,
    this.temperatureK,
    this.maxTemperatureC,
    this.maxTemperatureF,
    this.maxTemperatureK,
    this.minTemperatureC,
    this.minTemperatureF,
    this.minTemperatureK,
  });

  /// Заголовок
  final String title;

  /// Подзаголовок
  final String? subtitle;

  /// Иконка
  final String icon;

  /// Температура в градусах Цельсия
  final int? temperatureC;

  /// Температура в градусах Фаренгейта
  final int? temperatureK;

  /// Температура в Кельвинах
  final int? temperatureF;

  /// Минимальная температура в градусах Цельясия
  final int? minTemperatureC;

  /// Минимальная температура в градусах Фаренгейта
  final int? minTemperatureF;

  /// Минимальная температура в Кельвинах
  final int? minTemperatureK;

  /// Максимальная температура в градусах Цельсия
  final int? maxTemperatureC;

  /// Максимальная температура в градусах Фаренгейта
  final int? maxTemperatureF;

  /// Максимальная температура в Кельвинах
  final int? maxTemperatureK;

  /// Среднее давление в Паскалях
  final int pressureP;

  /// Среднее давление в миллиметрах ртутного столба
  final int pressureM;

  /// Средняя скорость ветра в метрах в секунду
  final double windM;

  /// Средняя скорость ветра в километрах в чах
  final double windK;

  /// Среднее направление ветра
  final String windDir;
}
