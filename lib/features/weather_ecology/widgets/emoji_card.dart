import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/features/weather_ecology/data/emotions.dart';

/// Виджет-эмоджи с glassmorphism-эффектом, как в iOS-стиле.
class EmojiCard extends StatelessWidget {
  const EmojiCard({required this.emotion, super.key});

  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    String imageAsset;
    Color tintColor;

    switch (emotion) {
      case Emotion.verySad:
        imageAsset = 'assets/images/svg/very_sad_emotion.svg';
        tintColor = const Color(0xFF9C182C);
        break;
      case Emotion.sad:
        imageAsset = 'assets/images/svg/sad_emotion.svg';
        tintColor = const Color(0xAF9A571E);
        break;
      case Emotion.calm:
        imageAsset = 'assets/images/svg/calm_emotion.svg';
        tintColor = const Color(0xCFBB9C02);
        break;
      case Emotion.happy:
        imageAsset = 'assets/images/svg/happy_emotion.svg';
        tintColor = const Color(0xFF728510);
        break;
      case Emotion.veryHappy:
        imageAsset = 'assets/images/svg/very_happy_emotion.svg';
        tintColor = const Color(0xFF3E6B30);
        break;
    }

    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.surface.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: cs.surface.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SvgPicture.asset(
            imageAsset,
            width: 36,
            height: 36,
            colorFilter: ColorFilter.mode(tintColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
