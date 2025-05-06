// Flutter imports:
import 'package:flutter/material.dart';

/// Кастомное расширение темы для стиля карточки уровня загрязнения.
class LevelCardStyle extends ThemeExtension<LevelCardStyle> {
  /// Создаёт объект стиля карточки уровня загрязнения.
  LevelCardStyle({required this.textColor});

  /// Цвет текста в карточке.
  final Color textColor;

  /// Возвращает копию текущего стиля с возможной заменой цвета текста.
  @override
  LevelCardStyle copyWith({Color? textColor}) {
    return LevelCardStyle(textColor: textColor ?? this.textColor);
  }

  /// Интерполяция между двумя стилями (например, при смене темы).
  @override
  LevelCardStyle lerp(
    covariant ThemeExtension<LevelCardStyle>? other,
    double t,
  ) {
    if (other is! LevelCardStyle) return this;

    return LevelCardStyle(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
