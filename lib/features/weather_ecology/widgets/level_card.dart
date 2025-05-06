// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_ecology/data/levels.dart';
import 'package:weather_app/features/weather_ecology/styles/level_card_style.dart';

/// Карточка уровня загрязнения (минимальный → критический).
class LevelCard extends StatelessWidget {
  /// Создаёт LevelCard.
  const LevelCard({required this.level, super.key, this.style});

  /// Уровень загрязнения.
  final Level level;

  /// Пользовательский стиль карточки (необязательно).
  final LevelCardStyle? style;

  /// Отображает карточку с цветом и надписью в зависимости от уровня.
  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<LevelCardStyle>()!;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    final textTheme = Theme.of(context).textTheme;

    String text;
    Color backgroundColor;

    switch (level) {
      case Level.critical:
        text = 'Критический';
        backgroundColor = const Color(0x5FE6344E);
      case Level.high:
        text = 'Высокий';
        backgroundColor = const Color(0x5FEF7E1E);
      case Level.normal:
        text = 'Нормальный';
        backgroundColor = const Color(0x5FFAD000);
      case Level.low:
        text = 'Низкий';
        backgroundColor = const Color(0x5FAAC810);
      case Level.minimal:
        text = 'Минимальный';
        backgroundColor = const Color(0x7F66B44F);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style: textTheme.bodyMedium?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
