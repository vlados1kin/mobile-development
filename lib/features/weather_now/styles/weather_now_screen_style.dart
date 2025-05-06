// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для домашнего экрана прогноза погоды
class WeatherNowScreenStyle extends ThemeExtension<WeatherNowScreenStyle> {
  /// Конструктор
  WeatherNowScreenStyle({
    required this.textColor,
    required this.backgroundColor,
  });

  /// Цвет текста
  final Color textColor;

  /// Фоновый цвет
  final Color backgroundColor;

  @override
  ThemeExtension<WeatherNowScreenStyle> copyWith({
    Color? textColor,
    Color? backgroundColor,
  }) {
    return WeatherNowScreenStyle(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  WeatherNowScreenStyle lerp(
    covariant ThemeExtension<WeatherNowScreenStyle>? other,
    double t,
  ) {
    if (other is! WeatherNowScreenStyle) return this;

    return WeatherNowScreenStyle(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
