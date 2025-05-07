// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомный стиль для экрана поиска локаций
class WeatherSettingsScreenStyle
    extends ThemeExtension<WeatherSettingsScreenStyle> {
  /// Конструктор
  WeatherSettingsScreenStyle({required this.titleTextColor});

  /// Цвет текста заголовка
  final Color titleTextColor;

  @override
  WeatherSettingsScreenStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return WeatherSettingsScreenStyle(
      titleTextColor: textColor ?? titleTextColor,
    );
  }

  @override
  WeatherSettingsScreenStyle lerp(
    covariant ThemeExtension<WeatherSettingsScreenStyle>? other,
    double t,
  ) {
    if (other is! WeatherSettingsScreenStyle) return this;

    return WeatherSettingsScreenStyle(
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t)!,
    );
  }
}


// const WeatherSettingsScreen({super.key, this.style});
//
// final WeatherSettingsScreenStyle? style;