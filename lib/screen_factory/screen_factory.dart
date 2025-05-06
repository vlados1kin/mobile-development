// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';

// Project imports:
import 'package:weather_app/features/about/view/about_screen.dart';
import 'package:weather_app/features/location/view/location_search_screen.dart';
import 'package:weather_app/features/main_navigation/view/main_navigation_screen.dart';
import 'package:weather_app/features/weather_alerts/view/weather_alerts_screen.dart';
import 'package:weather_app/features/weather_camera/view/view.dart';
import 'package:weather_app/features/weather_ecology/view/weather_ecology_screen.dart';
import 'package:weather_app/features/weather_now/view/view.dart';
import 'package:weather_app/features/weather_settings/view/weather_settings_screen.dart';

// Package imports:

/// Класс фабрики экранов
class ScreenFactory {
  /// Синглтон
  factory ScreenFactory() => _instance;

  /// Приватный конструктор
  ScreenFactory._internal();

  /// Приватный инстанс класса
  static final ScreenFactory _instance = ScreenFactory._internal();

  /// Инстанс камеры
  CameraDescription? camera;

  /// Создать коренной экран
  Widget makeRootScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const MainNavigationScreen(),
      );
    },
  );

  /// Создать домашний экран погоды
  Widget makeWeatherNowScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const WeatherNowScreen(),
      );
    },
  );

  /// Создать экран экологии
  Widget makeWeatherEcologyScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const WeatherEcologyScreen(),
      );
    },
  );

  /// Создать экран настроек
  Widget makeSettingsScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const WeatherSettingsScreen(),
      );
    },
  );

  /// Создать экран 'О приложении'
  Widget makeAboutScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const AboutScreen(),
      );
    },
  );

  /// Создать экран с чрезвычайными ситуациями
  Widget makeWeatherAlertsScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const WeatherAlertsScreen(),
      );
    },
  );

  /// Создать экран с локациями
  Widget makeLocationSearchScreen() => Builder(
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: const LocationSearchScreen(),
      );
    },
  );

  /// Создать экран камеры
  Widget makeWeatherCameraScreen() => Builder(
    builder: (context) {
      if (camera == null) {
        return const Placeholder();
      }

      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: WeatherCamera(camera: camera!),
      );
    },
  );
}
