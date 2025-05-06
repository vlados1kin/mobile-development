// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для виджета выдвижного списка прогноза
class WeatherListDraggableSheetStyle
    extends ThemeExtension<WeatherListDraggableSheetStyle> {
  /// Конструктор
  WeatherListDraggableSheetStyle({required this.backgroundColor});

  /// Фоновый цвет
  final Color backgroundColor;

  @override
  ThemeExtension<WeatherListDraggableSheetStyle> copyWith({
    Color? backgroundColor,
  }) => WeatherListDraggableSheetStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
  );

  @override
  WeatherListDraggableSheetStyle lerp(
    covariant ThemeExtension<WeatherListDraggableSheetStyle>? other,
    double t,
  ) {
    if (other is! WeatherListDraggableSheetStyle) return this;

    return WeatherListDraggableSheetStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
