// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы виджета экрана почасового прогноза
class WeatherDayForecastScreenStyle
    extends ThemeExtension<WeatherDayForecastScreenStyle> {
  /// Конструктор
  WeatherDayForecastScreenStyle({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.backgroundColor,
  });

  /// Стиль заголовка
  final TextStyle titleStyle;

  /// Стиль подзаголовка
  final TextStyle subtitleStyle;

  /// Фоновый цвет
  final Color backgroundColor;

  @override
  WeatherDayForecastScreenStyle copyWith({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    Color? backgroundColor,
  }) => WeatherDayForecastScreenStyle(
    titleStyle: titleStyle ?? this.titleStyle,
    subtitleStyle: subtitleStyle ?? this.subtitleStyle,
    backgroundColor: backgroundColor ?? this.backgroundColor,
  );

  @override
  WeatherDayForecastScreenStyle lerp(
    covariant ThemeExtension<WeatherDayForecastScreenStyle>? other,
    double t,
  ) {
    if (other is! WeatherDayForecastScreenStyle) return this;

    return WeatherDayForecastScreenStyle(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
