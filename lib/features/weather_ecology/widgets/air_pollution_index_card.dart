import 'dart:ui';
import 'package:flutter/material.dart';

/// Виджет карточки индекса загрязнения воздуха в стиле glassmorphism,
/// где фон меняется в зависимости от качества воздуха.
class AirPollutionIndexCard extends StatelessWidget {
  const AirPollutionIndexCard({
    required this.value,
    required this.valueIndex,
    super.key,
  });

  final int value;
  final int valueIndex;

  @override
  Widget build(BuildContext context) {
    final theme   = Theme.of(context);
    final cs      = theme.colorScheme;
    const radius  = 20.0;
    const padding = EdgeInsets.all(16);

    // Описание и базовый цвет в зависимости от уровня
    String description;
    Color baseColor;
    switch (valueIndex) {
      case 1:
        description = 'Отлично';
        baseColor = const Color(0xFF66B44F);
      case 2:
        description = 'Хорошо';
        baseColor = const Color(0xFFAAC810);
      case 3:
        description = 'Нормально';
        baseColor = const Color(0xFFFAD000);
      case 4:
        description = 'Плохо';
        baseColor = const Color(0xFFEF7E1E);
      case 5:
        description = 'Ужасно';
        baseColor = const Color(0xFFC6344E);
      default:
        description = 'Отлично';
        baseColor = const Color(0xFF66B44F);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            // glass background tinted by baseColor
            color: baseColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: baseColor.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Индекс $value',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: cs.onSurface.withOpacity(0.85),
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
