// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:weather_app/features/weather_ecology/data/emotions.dart';

/// Виджет-эмоджи по эмоциональному состоянию.
class EmojiCard extends StatelessWidget {
  /// Конструктор EmojiCard.
  const EmojiCard({required this.emotion, super.key});

  /// Эмоция, определяющая иконку и цвет.
  final Emotion emotion;

  /// Построение карточки с эмоджи.
  @override
  Widget build(BuildContext context) {
    String image;
    Color backgroundColor;
    Color emojiColor;

    switch (emotion) {
      case Emotion.verySad:
        image = 'assets/images/svg/very_sad_emotion.svg';
        backgroundColor = const Color(0xFFC6344E);
        emojiColor = const Color(0xFF9C182C);
      case Emotion.sad:
        image = 'assets/images/svg/sad_emotion.svg';
        backgroundColor = const Color(0xFFEF7E1E);
        emojiColor = const Color(0xAF9A571E);
      case Emotion.calm:
        image = 'assets/images/svg/calm_emotion.svg';
        backgroundColor = const Color(0xFFFAD000);
        emojiColor = const Color(0xCFBB9C02);
      case Emotion.happy:
        image = 'assets/images/svg/happy_emotion.svg';
        backgroundColor = const Color(0xFFAAC810);
        emojiColor = const Color(0xFF728510);
      case Emotion.veryHappy:
        image = 'assets/images/svg/very_happy_emotion.svg';
        backgroundColor = const Color(0xFF66B44F);
        emojiColor = const Color(0xFF3E6B30);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: SvgPicture.asset(
        image,
        colorFilter: ColorFilter.mode(emojiColor, BlendMode.srcIn),
      ),
    );
  }
}
