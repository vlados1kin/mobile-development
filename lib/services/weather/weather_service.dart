// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Project imports:
import 'package:weather_app/services/weather/models/models.dart';

/// Класс сервиса погоды
class WeatherService {
  /// Фабрика для создания экземпляра WeatherService
  factory WeatherService() => instance;

  WeatherService._internal();

  /// Синглтон
  static final WeatherService instance = WeatherService._internal();

  final Dio _dio = Dio();
  final String _key = dotenv.env['WEATHER_API_KEY']!;

  /// Получить погоду по названию города
  Future<WeatherApiResponse> fetchWeather({required String city}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        'q': city,
        'days': 7,
        'lang': 'ru',
        'alerts': 'yes',
        'aqi': 'yes',
        'key': _key,
      },
    );
    return WeatherApiResponse.fromJson(response.data!);
  }
}
