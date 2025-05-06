// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_now/styles/weather_param_card_style.dart';

/// Виджет карточки с основной информацией о погоде
class WeatherParamCard extends StatelessWidget {
  /// Конструктор
  const WeatherParamCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.units,
    super.key,
    this.style,
  });

  /// Картинка иконки
  final IconData icon;

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
    final iconSize = style?.iconSize ?? defaultStyle.iconSize;
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
      child: Row(
        children: [
          Icon(icon, size: iconSize, color: textColor),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.labelMedium?.copyWith(
                  color: textColor.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: textTheme.headlineMedium?.copyWith(color: textColor),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    units,
                    style: textTheme.labelMedium?.copyWith(
                      color: textColor.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
