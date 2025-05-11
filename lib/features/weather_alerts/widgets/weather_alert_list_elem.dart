import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
import 'package:weather_app/features/weather_alerts/styles/weather_alert_list_elem_style.dart';
import 'package:weather_app/features/weather_forecast/styles/weather_list_elem_style.dart';

/// Виджет элемента списка предупреждений
class WeatherAlertListElem extends StatelessWidget {
  const WeatherAlertListElem({
    required this.alertData,
    super.key,
    this.style,
  });

  final WeatherAlertData alertData;
  final WeatherListElemStyle? style;

  /// Форматирует диапазон дат
  String formatRange(DateTime start, DateTime end) {
    final format = DateFormat('dd.MM.yyyy HH:mm');
    return '${format.format(start)} - ${format.format(end)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final defaultStyle = theme.extension<WeatherAlertListElemStyle>()!;

    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final backgroundColor = isDark ? Colors.grey[850] : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alertData.event,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              formatRange(alertData.start, alertData.end),
              style: theme.textTheme.labelMedium?.copyWith(
                color: textColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              alertData.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: textColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}