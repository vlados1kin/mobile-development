import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_ecology/styles/pollution_list_elem_style.dart';

/// Отображает элемент списка с данными об одном загрязнителе,
/// стилизованный под iOS-подобное "glass" оформление.
class PollutionListElem extends StatelessWidget {
  const PollutionListElem({
    required this.pollutionData,
    super.key,
  });

  final PollutionData pollutionData;

  Color _backgroundForLevel(Level level) {
    switch (level) {
      case Level.minimal:
        return const Color(0xFF9EE6B8).withOpacity(0.25);
      case Level.low:
        return const Color(0xFFC8E986).withOpacity(0.25);
      case Level.normal:
        return const Color(0xFFFFDD85).withOpacity(0.25);
      case Level.high:
        return const Color(0xFFFFA97A).withOpacity(0.25);
      case Level.critical:
        return const Color(0xFFFF5E6C).withOpacity(0.25);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style     = PollutionListElemStyle.of(context);
    final theme     = Theme.of(context);
    final cs        = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bgColor = _backgroundForLevel(pollutionData.level);

    return ClipRRect(
      borderRadius: BorderRadius.circular(style.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(style.borderRadius),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // распределяем равномерно
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      pollutionData.element,
                      style: textTheme.bodyLarge?.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${pollutionData.value}',
                    style: textTheme.bodyLarge?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  pollutionData.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.onSurface.withOpacity(0.75),
                    height: 1.3,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
