// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_ecology/styles/air_pollution_index_card_style.dart';
import 'package:weather_app/features/weather_ecology/widgets/widgets.dart';

/// Виджет карточки индекса загрязнения воздуха.
class AirPollutionIndexCard extends StatelessWidget {
  /// Конструктор карточки.
  const AirPollutionIndexCard({
    required this.value,
    required this.valueIndex,
    this.style,
    super.key,
  });

  /// Значение индекса.
  final int value;

  /// Индекс уровня загрязнения (от 1 до 5).
  final int valueIndex;

  /// Стилизация карточки (необязательно).
  final AirPollutionIndexCardStyle? style;

  /// Построение виджета карточки.
  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        Theme.of(context).extension<AirPollutionIndexCardStyle>()!;

    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    final textTheme = Theme.of(context).textTheme;

    String description;
    Emotion emotion;

    switch (valueIndex) {
      case 1:
        description = 'Очень чистый\nвоздух';
        emotion = Emotion.veryHappy;
      case 2:
        description = 'Чистый\nвоздух';
        emotion = Emotion.happy;
      case 3:
        description = 'Нормальный\nвоздух';
        emotion = Emotion.calm;
      case 4:
        description = 'Грязный\nвоздух';
        emotion = Emotion.sad;
      case 5:
        description = 'Очень грязный\nвоздух';
        emotion = Emotion.verySad;
      default:
        description = 'Очень чистый\nвоздух';
        emotion = Emotion.veryHappy;
    }

    return Container(
      height: 100,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$value',
            style: textTheme.displaySmall?.copyWith(color: textColor),
          ),
          Text(
            description,
            style: textTheme.labelMedium?.copyWith(
              color: textColor.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(
            width: 150,
            height: double.infinity,
            child: EmojiCard(emotion: emotion),
          ),
        ],
      ),
    );
  }
}
