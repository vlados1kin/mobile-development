import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_now/styles/weather_param_card_style.dart';

/// Виджет карточки с основной информацией о погоде
class WeatherParamCard extends StatelessWidget {
  /// Конструктор
  const WeatherParamCard({
    required this.title,
    required this.value,
    required this.units,
    super.key,
    this.style,
  });

  /// Заголовок
  final String title;

  /// Значение
  final String value;

  /// Единицы измерения значения
  final String units;

  /// Кастомный стиль
  final WeatherParamCardStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final defaultStyle = Theme.of(context).extension<WeatherParamCardStyle>()!;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Название параметра
          Text(
            title,
            style: textTheme.labelMedium?.copyWith(
              color: textColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 7),

          // Значение параметра и единицы измерения
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: textTheme.headlineMedium?.copyWith(color: textColor),
                ),
              ),
              const SizedBox(width: 3),
              Text(
                units,
                style: textTheme.labelMedium?.copyWith(
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}