import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_ecology/data/levels.dart';
import 'package:weather_app/features/weather_ecology/styles/level_card_style.dart';

/// Карточка уровня загрязнения в стиле iOS (минимальный → критический).
class LevelCard extends StatelessWidget {
  const LevelCard({
    required this.level,
    super.key,
    this.style,
  });

  final Level level;
  final LevelCardStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<LevelCardStyle>()!;
    final textColor = style?.textColor ?? defaultStyle.textColor;
    final textTheme = Theme.of(context).textTheme;

    String text;
    Color color;

    switch (level) {
      case Level.critical:
        text = 'Критический';
        color = const Color(0xFFDC3545); // Красный
        break;
      case Level.high:
        text = 'Высокий';
        color = const Color(0xFFFFA500); // Оранжевый
        break;
      case Level.normal:
        text = 'Нормальный';
        color = const Color(0xFFFFD700); // Жёлтый
        break;
      case Level.low:
        text = 'Низкий';
        color = const Color(0xFF8BC34A); // Светло-зелёный
        break;
      case Level.minimal:
        text = 'Минимальный';
        color = const Color(0xFF4CAF50); // Зелёный
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12), // Полупрозрачный цвет
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.25), width: 1),
      ),
      child: Center(
        child: Text(
          text,
          style: textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
