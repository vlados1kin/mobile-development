// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для виджета карточки информации о погоде
class WeatherParamCardStyle extends ThemeExtension<WeatherParamCardStyle> {
  /// Конструктор
  WeatherParamCardStyle({
    required this.iconSize,
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Размер иконки
  final double iconSize;

  /// Радиус закругления элемента
  final double borderRadius;

  /// Отступы
  final EdgeInsets padding;

  /// Фоновый цвет
  final Color backgroundColor;

  /// Цвет текста
  final Color textColor;

  @override
  ThemeExtension<WeatherParamCardStyle> copyWith({
    double? iconSize,
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) => WeatherParamCardStyle(
    iconSize: iconSize ?? this.iconSize,
    borderRadius: borderRadius ?? this.borderRadius,
    padding: padding ?? this.padding,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    textColor: textColor ?? this.textColor,
  );

  @override
  ThemeExtension<WeatherParamCardStyle> lerp(
    covariant ThemeExtension<WeatherParamCardStyle>? other,
    double t,
  ) {
    if (other is! WeatherParamCardStyle) return this;

    return WeatherParamCardStyle(
      iconSize: lerpDouble(iconSize, other.iconSize, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
