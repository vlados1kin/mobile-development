// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомный стиль для элемента списка локаций
class LocationsListElemStyle extends ThemeExtension<LocationsListElemStyle> {
  /// Конструктор
  LocationsListElemStyle({
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
  });

  /// Радиус границы
  final double borderRadius;

  /// Отступы
  final EdgeInsets padding;

  /// Цвет фона
  final Color backgroundColor;

  @override
  LocationsListElemStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return LocationsListElemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  LocationsListElemStyle lerp(
    covariant ThemeExtension<LocationsListElemStyle>? other,
    double t,
  ) {
    if (other is! LocationsListElemStyle) return this;

    return LocationsListElemStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
