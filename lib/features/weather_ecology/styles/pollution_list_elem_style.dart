// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// iOS-подобный стиль элемента списка загрязнения
/// полностью берёт цвета из темы, как в AboutScreen
class PollutionListElemStyle extends ThemeExtension<PollutionListElemStyle> {
  const PollutionListElemStyle({
    required this.borderRadius,
    required this.padding,
  });

  /// Радиус скругления углов
  final double borderRadius;

  /// Внутренние отступы
  final EdgeInsets padding;

  /// Создаёт стиль, основанный на текущей теме
  factory PollutionListElemStyle.of(BuildContext context) {
    final theme = Theme.of(context);
    return PollutionListElemStyle(
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
    );
  }

  @override
  PollutionListElemStyle copyWith({
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return PollutionListElemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  PollutionListElemStyle lerp(
      covariant ThemeExtension<PollutionListElemStyle>? other,
      double t,
      ) {
    if (other is! PollutionListElemStyle) return this;
    return PollutionListElemStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}
