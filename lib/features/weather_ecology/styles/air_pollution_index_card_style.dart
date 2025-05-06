// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для карточки индекса загрязнения воздуха.
class AirPollutionIndexCardStyle
    extends ThemeExtension<AirPollutionIndexCardStyle> {
  /// Создаёт объект стиля карточки загрязнения воздуха.
  AirPollutionIndexCardStyle({
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Радиус скругления границ карточки.
  final double borderRadius;

  /// Отступы внутри карточки.
  final EdgeInsets padding;

  /// Цвет фона карточки.
  final Color backgroundColor;

  /// Цвет основного текста.
  final Color textColor;

  /// Возвращает копию текущего стиля с возможностью изменения отдельных полей.
  @override
  AirPollutionIndexCardStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return AirPollutionIndexCardStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  /// Интерполяция между двумя стилями (для анимаций и переходов темы).
  @override
  AirPollutionIndexCardStyle lerp(
    covariant ThemeExtension<AirPollutionIndexCardStyle>? other,
    double t,
  ) {
    if (other is! AirPollutionIndexCardStyle) return this;

    return AirPollutionIndexCardStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
