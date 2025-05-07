// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для переключателя настроек
class ToggleSettingsRowStyle extends ThemeExtension<ToggleSettingsRowStyle> {
  /// Конструктор
  const ToggleSettingsRowStyle({
    required this.borderRadius,
    required this.borderWidth,
    required this.color,
    required this.selectedColor,
    required this.fillColor,
    required this.borderColor,
    required this.selectedBorderColor,
  });

  /// Радиус закругления элемента
  final double borderRadius;

  /// Толщина границ элемента
  final double borderWidth;

  /// Цвет текста элемента
  final Color color;

  /// Цвет текста выбранного элемента
  final Color selectedColor;

  /// Цвет заливки выбранного элемента
  final Color fillColor;

  /// Цвет границы элемента
  final Color borderColor;

  /// Цвет границы выбранного элемента
  final Color selectedBorderColor;

  @override
  ToggleSettingsRowStyle copyWith({
    double? borderRadius,
    double? borderWidth,
    Color? color,
    Color? selectedColor,
    Color? fillColor,
    Color? borderColor,
    Color? selectedBorderColor,
  }) {
    return ToggleSettingsRowStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      color: color ?? this.color,
      selectedColor: selectedColor ?? this.selectedColor,
      fillColor: fillColor ?? this.fillColor,
      borderColor: borderColor ?? this.borderColor,
      selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
    );
  }

  @override
  ToggleSettingsRowStyle lerp(
      covariant ThemeExtension<ToggleSettingsRowStyle>? other,
      double t,
      ) {
    if (other is! ToggleSettingsRowStyle) return this;

    return ToggleSettingsRowStyle(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      color: Color.lerp(color, other.color, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      selectedBorderColor:
      Color.lerp(selectedBorderColor, other.selectedBorderColor, t)!,
    );
  }
}
