// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для виджета информации о погоде
class WeatherInfoStyle extends ThemeExtension<WeatherInfoStyle> {
  /// Конструктор
  WeatherInfoStyle({required this.textColor});

  /// Цвет текста
  final Color textColor;

  @override
  WeatherInfoStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return WeatherInfoStyle(textColor: textColor ?? this.textColor);
  }

  @override
  WeatherInfoStyle lerp(
    covariant ThemeExtension<WeatherInfoStyle>? other,
    double t,
  ) {
    if (other is! WeatherInfoStyle) return this;

    return WeatherInfoStyle(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
