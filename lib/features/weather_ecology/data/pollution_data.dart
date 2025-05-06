// Project imports:
import 'package:weather_app/features/weather_ecology/data/levels.dart';

/// Класс, представляющий данные о загрязнении воздуха.
class PollutionData {
  /// Конструктор класса PollutionData.
  PollutionData({
    required this.element,
    required this.description,
    required this.value,
    required this.level,
  });

  /// Элемент загрязнения (например, CO2, NO2).
  final String element;

  /// Описание загрязняющего элемента.
  final String description;

  /// Значение концентрации загрязняющего вещества.
  final double value;

  /// Уровень загрязнения воздуха.
  final Level level;
}
