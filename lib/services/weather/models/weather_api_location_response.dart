// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'weather_api_location_response.g.dart';

/// Модель ответа API погоды для местоположения
@JsonSerializable(explicitToJson: true)
class WeatherApiLocationResponse {
  /// Конструктор
  WeatherApiLocationResponse({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  /// Создание объекта из JSON
  factory WeatherApiLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiLocationResponseFromJson(json);

  /// Уникальный идентификатор местоположения
  final int id;

  /// Название местоположения
  final String name;

  /// Регион местоположения
  final String region;

  /// Страна местоположения
  final String country;

  /// Широта местоположения
  final double lat;

  /// Долгота местоположения
  final double lon;

  /// URL для получения дополнительной информации о местоположении
  final String url;

  /// Преобразование объекта в JSON
  Map<String, dynamic> toJson() => _$WeatherApiLocationResponseToJson(this);
}
