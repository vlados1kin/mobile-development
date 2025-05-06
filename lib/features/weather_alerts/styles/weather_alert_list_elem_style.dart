// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для элемента списка информации о ЧС
class WeatherAlertListElemStyle
    extends ThemeExtension<WeatherAlertListElemStyle> {
  /// Конструктор
  WeatherAlertListElemStyle({
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Радиус закругления элемента
  final double borderRadius;

  /// Отступ
  final EdgeInsets padding;

  /// Фоновый цвет
  final Color backgroundColor;

  /// Цвет текста
  final Color textColor;

  @override
  WeatherAlertListElemStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return WeatherAlertListElemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  WeatherAlertListElemStyle lerp(
    covariant ThemeExtension<WeatherAlertListElemStyle>? other,
    double t,
  ) {
    if (other is! WeatherAlertListElemStyle) return this;

    return WeatherAlertListElemStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
