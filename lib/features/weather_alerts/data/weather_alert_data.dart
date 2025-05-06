/// Класс содержит инфомрацию о чрезвычайной ситуации
class WeatherAlertData {
  /// Конструктор
  WeatherAlertData({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
  });

  /// Название отправителя
  final String senderName;

  /// Название события
  final String event;

  /// Описание события
  final String description;

  /// Дата начала события
  final DateTime start;

  /// Дата окончания события
  final DateTime end;
}
