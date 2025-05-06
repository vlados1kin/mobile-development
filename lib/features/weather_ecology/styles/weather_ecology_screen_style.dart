// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для экрана экологии.
class WeatherEcologyScreenStyle
    extends ThemeExtension<WeatherEcologyScreenStyle> {
  /// Конструктор для создания объекта стиля экрана.
  WeatherEcologyScreenStyle({
    required this.backgroundColor,
    required this.textColor,
  });

  /// Цвет фона экрана.
  final Color backgroundColor;

  /// Цвет текста на экране.
  final Color textColor;

  /// Создаёт копию стиля с возможными изменениями параметров.
  @override
  WeatherEcologyScreenStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return WeatherEcologyScreenStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  /// Интерполяция между двумя стилями (например, при смене темы).
  @override
  WeatherEcologyScreenStyle lerp(
    covariant ThemeExtension<WeatherEcologyScreenStyle>? other,
    double t,
  ) {
    if (other is! WeatherEcologyScreenStyle) return this;

    return WeatherEcologyScreenStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
