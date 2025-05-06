// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:weather_app/features/location/data/data.dart';
import 'package:weather_app/services/weather/models/weather_api_location_response.dart';

/// Класс сервиса локаций
class LocationService {
  /// Фабрика для создания экземпляра LocationService
  factory LocationService() => instance;

  /// Приватный конструктор
  LocationService._internal();

  /// Синглтон
  static final LocationService instance = LocationService._internal();

  final Dio _dio = Dio();
  final String _key = dotenv.env['WEATHER_API_KEY']!;

  /// Поиск локации по названию
  Future<List<WeatherApiLocationResponse>> searchLocation({
    required String query,
  }) async {
    if (query.isEmpty) {
      return [];
    }

    final response = await _dio.get<List<dynamic>>(
      'https://api.weatherapi.com/v1/search.json',
      queryParameters: {'q': query, 'key': _key, 'lang': 'ru'},
    );
    return (response.data!)
        .map(
          (e) => WeatherApiLocationResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  /// Получение текущей локации из shared preferences
  Future<LocationData?> getCurrentLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('current_city');
    final country = prefs.getString('current_country');

    if (city == null || country == null) {
      return null;
    } else {
      return LocationData(city: city, country: country);
    }
  }

  /// Сохранение текущей локации в shared preferences
  Future<void> saveCurrentLocation(LocationData location) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_city', location.city);
    await prefs.setString('current_country', location.country);
  }
}
