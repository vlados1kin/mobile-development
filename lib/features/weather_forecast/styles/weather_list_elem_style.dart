// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение стиля виджета элемента списка прогноза
class WeatherListElemStyle extends ThemeExtension<WeatherListElemStyle> {
  /// Конструктор
  WeatherListElemStyle({
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Радиус закругления элемента
  final double borderRadius;

  /// Отступ
  final EdgeInsets padding;

  /// Фоновый цвет элемента
  final Color backgroundColor;

  /// Цвет текста на элементе
  final Color textColor;

  @override
  WeatherListElemStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return WeatherListElemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  WeatherListElemStyle lerp(
    covariant ThemeExtension<WeatherListElemStyle>? other,
    double t,
  ) {
    if (other is! WeatherListElemStyle) return this;

    return WeatherListElemStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
