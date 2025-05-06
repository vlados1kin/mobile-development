// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/services/settings/settings.dart';

/// Провайдер, предоставляющий настройки приложения
class SettingsProvider extends ChangeNotifier {
  /// Конструктор
  SettingsProvider(this._service);

  /// Сервис настроек
  final SettingsService _service;

  /// Единицы измерения температуры, по умолчачнию градусы Цельсия
  TemperatureUnit _temperatureUnit = TemperatureUnit.celsius;

  /// Единицы измерения атмосферного давления, по умолчанию Паскали
  PressureUnit _pressureUnit = PressureUnit.hpa;

  /// Единицы измерения скорости ветра, по умолчанию метры в секунду
  WindSpeedUnit _windSpeedUnit = WindSpeedUnit.mps;

  /// Тема приложения
  ThemeUnit _themeUnit = ThemeUnit.light;

  /// Флаг загрузки настроек
  bool _isInitialized = false;

  /// Геттер получения единиц измерения температуры
  TemperatureUnit get temperatureUnit => _temperatureUnit;

  /// Геттер получения единиц измереиия атосферного давления
  PressureUnit get pressureUnit => _pressureUnit;

  /// Геттер получения единиц измерения скорости ветра
  WindSpeedUnit get windSpeedUnit => _windSpeedUnit;

  /// Геттер получения темы приложения
  ThemeUnit get themeUnit => _themeUnit;

  /// Геттер получения флага загрузки настроек
  bool get isInitialized => _isInitialized;

  /// Получает настройки приложения от сервиса настроек
  Future<void> loadSettings() async {
    _temperatureUnit = await _service.getEnum(
      key: SettingsKey.keyTempUnit,
      values: TemperatureUnit.values,
      defaultValue: TemperatureUnit.celsius,
    );

    _pressureUnit = await _service.getEnum(
      key: SettingsKey.keyPressureUnit,
      values: PressureUnit.values,
      defaultValue: PressureUnit.hpa,
    );

    _windSpeedUnit = await _service.getEnum(
      key: SettingsKey.keyWindSpeedUnit,
      values: WindSpeedUnit.values,
      defaultValue: WindSpeedUnit.mps,
    );

    _themeUnit = await _service.getEnum(
      key: SettingsKey.keyTheme,
      values: ThemeUnit.values,
      defaultValue: ThemeUnit.light,
    );

    _isInitialized = true;
    notifyListeners();
  }

  /// Сеттер для единиц измерения температуры
  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    _temperatureUnit = unit;
    await _service.setEnum(key: SettingsKey.keyTempUnit, value: unit);
    notifyListeners();
  }

  /// Сеттер для единиц измерения атомсферного давления
  Future<void> setPressureUnit(PressureUnit unit) async {
    _pressureUnit = unit;
    await _service.setEnum(key: SettingsKey.keyPressureUnit, value: unit);
    notifyListeners();
  }

  /// Сеттер для единиц измерения скорости ветра
  Future<void> setWindSpeedUnit(WindSpeedUnit unit) async {
    _windSpeedUnit = unit;
    await _service.setEnum(key: SettingsKey.keyWindSpeedUnit, value: unit);
    notifyListeners();
  }

  /// Сеттер для темы приложения
  Future<void> setThemeUnit(ThemeUnit unit) async {
    _themeUnit = unit;
    await _service.setEnum(key: SettingsKey.keyTheme, value: unit);
    notifyListeners();
  }
}
