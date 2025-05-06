// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
import 'package:weather_app/features/weather_alerts/styles/weather_alert_list_elem_style.dart';
import 'package:weather_app/features/weather_forecast/styles/weather_list_elem_style.dart';

/// Виджет элемента списка предупреждений
class WeatherAlertListElem extends StatelessWidget {
  /// Конструктор
  const WeatherAlertListElem({
    required this.alertData,
    super.key,
    this.onTap,
    this.style,
  });

  /// Информация о предупреждении
  final WeatherAlertData alertData;

  /// Колбэк нажатия на элемент
  final VoidCallback? onTap;

  /// Кастомный стиль элемента
  final WeatherListElemStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle =
        Theme.of(context).extension<WeatherAlertListElemStyle>()!;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: backgroundColor,
        ),
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    alertData.senderName.replaceAll('\n', ' '),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('dd.MM.yyyy').format(alertData.start),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: textColor.withValues(alpha: 0.7),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: textColor.withValues(alpha: 0.7),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 4)),
            Text(
              alertData.event.replaceAll('\n', ' '),
              style: theme.textTheme.labelMedium?.copyWith(
                color: textColor.withValues(alpha: 0.7),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
