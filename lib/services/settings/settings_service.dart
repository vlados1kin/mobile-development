// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:weather_app/services/settings/models/models.dart';

/// Класс сервиса настроек
///
/// Настройки хранятся в shared preferences
class SettingsService {
  /// Фабрика для создания экземпляра класса
  factory SettingsService() => _instance;

  /// Приватный конструктор
  SettingsService._internal();

  /// Приватный экземпляр класса
  static final SettingsService _instance = SettingsService._internal();

  /// Сохранить ключ в shared preferences
  ///
  /// [key] - названия ключа, значение должно быть из SettingsKey
  /// [value] - значение ключа, должен быть перечислением или его расширенем
  Future<void> setEnum<T extends Enum>({
    required SettingsKey key,
    required T value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.name, value.name);
  }

  /// Прочитать ключ из shared preferences
  ///
  /// [key] - название ключа, значение должно быть из SettingsKey
  /// [values] - список возможных значений перечисления
  /// [defaultValue] - значение по умолчанию;
  /// возвразается, если ключ не был найден в shared preferences
  /// тип должен быть перечислением или его расширением
  Future<T> getEnum<T extends Enum>({
    required SettingsKey key,
    required List<T> values,
    required T defaultValue,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key.name);
    if (raw == null) return defaultValue;
    return values.firstWhere((e) => e.name == raw, orElse: () => defaultValue);
  }
}
