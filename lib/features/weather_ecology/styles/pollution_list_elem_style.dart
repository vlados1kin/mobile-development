// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для стиля элемента списка загрязнения.
class PollutionListElemStyle extends ThemeExtension<PollutionListElemStyle> {
  /// Создаёт объект стиля элемента списка загрязнения с указанными параметрами.
  PollutionListElemStyle({
    required this.borderRadius,
    required this.padding,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Радиус скругления углов элемента списка.
  final double borderRadius;

  /// Отступы внутри элемента списка.
  final EdgeInsets padding;

  /// Цвет фона элемента списка.
  final Color backgroundColor;

  /// Цвет текста внутри элемента списка.
  final Color textColor;

  /// Возвращает новый стиль с возможностью изменения параметров.
  @override
  PollutionListElemStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return PollutionListElemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  /// Интерполяция между двумя стилями (например, при смене темы).
  @override
  PollutionListElemStyle lerp(
    covariant ThemeExtension<PollutionListElemStyle>? other,
    double t,
  ) {
    if (other is! PollutionListElemStyle) return this;

    return PollutionListElemStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
