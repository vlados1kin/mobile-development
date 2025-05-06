// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомный стиль для экрана поиска локаций
class LocationSearchScreenStyle
    extends ThemeExtension<LocationSearchScreenStyle> {
  /// Конструктор
  LocationSearchScreenStyle({required this.titleTextColor});

  /// Цвет текста заголовка
  final Color titleTextColor;

  @override
  LocationSearchScreenStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return LocationSearchScreenStyle(
      titleTextColor: textColor ?? titleTextColor,
    );
  }

  @override
  LocationSearchScreenStyle lerp(
    covariant ThemeExtension<LocationSearchScreenStyle>? other,
    double t,
  ) {
    if (other is! LocationSearchScreenStyle) return this;

    return LocationSearchScreenStyle(
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t)!,
    );
  }
}
