// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расшиерение темы для экрана информации с предупреждениями
class WeatherAlertInfoScreenStyle
    extends ThemeExtension<WeatherAlertInfoScreenStyle> {
  /// Конструктор
  WeatherAlertInfoScreenStyle({
    required this.backgroundColor,
    required this.titleTextColor,
    required this.titleBackgroundColor,
    required this.infoTextColor,
    required this.infoBackgroundColor,
  });

  /// Фоновый цвет
  final Color backgroundColor;

  /// Цвет текста заголовка
  final Color titleTextColor;

  /// Фоновый цвет текста заголовка
  final Color titleBackgroundColor;

  /// Цвет текста информации
  final Color infoTextColor;

  /// Фоновый цвет текста информации
  final Color infoBackgroundColor;

  @override
  WeatherAlertInfoScreenStyle copyWith({
    Color? backgroundColor,
    Color? titleTextColor,
    Color? titleBackgroundColor,
    Color? infoTextColor,
    Color? infoBackgroundColor,
  }) {
    return WeatherAlertInfoScreenStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      titleBackgroundColor: titleBackgroundColor ?? this.titleBackgroundColor,
      infoTextColor: infoTextColor ?? this.infoTextColor,
      infoBackgroundColor: infoBackgroundColor ?? this.infoBackgroundColor,
    );
  }

  @override
  WeatherAlertInfoScreenStyle lerp(
    covariant ThemeExtension<WeatherAlertInfoScreenStyle>? other,
    double t,
  ) {
    if (other is! WeatherAlertInfoScreenStyle) return this;

    return WeatherAlertInfoScreenStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t)!,
      titleBackgroundColor:
          Color.lerp(titleBackgroundColor, other.titleBackgroundColor, t)!,
      infoTextColor: Color.lerp(infoTextColor, other.infoTextColor, t)!,
      infoBackgroundColor:
          Color.lerp(infoBackgroundColor, other.infoBackgroundColor, t)!,
    );
  }
}
