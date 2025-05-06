// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_ecology/styles/pollution_list_elem_style.dart';
import 'package:weather_app/features/weather_ecology/widgets/widgets.dart';

/// Отображает элемент списка с данными об одном загрязнителе.
class PollutionListElem extends StatelessWidget {
  /// Создаёт элемент списка загрязнителя.
  const PollutionListElem({required this.pollutionData, super.key, this.style});

  /// Данные об уровне загрязнителя.
  final PollutionData pollutionData;

  /// Стилизация элемента списка.
  final PollutionListElemStyle? style;

  /// Строит UI-элемент с описанием загрязнителя, значением и уровнем.
  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<PollutionListElemStyle>()!;

    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: backgroundColor,
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pollutionData.element,
                      style: textTheme.bodyMedium?.copyWith(color: textColor),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 2)),
                    Text(
                      pollutionData.description,
                      style: textTheme.labelMedium?.copyWith(
                        color: textColor.withValues(alpha: 0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 15)),
              Text(
                '${pollutionData.value}',
                style: textTheme.bodyLarge?.copyWith(color: textColor),
              ),
            ],
          ),
          SizedBox(width: 150, child: LevelCard(level: pollutionData.level)),
        ],
      ),
    );
  }
}
