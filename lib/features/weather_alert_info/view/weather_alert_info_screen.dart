// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:weather_app/features/weather_alert_info/styles/weather_alert_info_screen_style.dart';
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
import 'package:weather_app/features/weather_settings/widgets/list_divider.dart';

/// Экран с ифнормацией о чрезвычайных ситуациях
class WeatherAlertInfoScreen extends StatelessWidget {
  /// Конструктор
  const WeatherAlertInfoScreen({
    required this.alertData,
    super.key,
    this.style,
  });

  /// Данные о чрезвычайных ситуациях
  final WeatherAlertData alertData;

  /// Пользовательский стиль
  final WeatherAlertInfoScreenStyle? style;

  /// Получить оформатированный диапазон дат
  ///
  /// [start] - начальная дата
  /// [end] - конечная дата
  String formatRange(DateTime start, DateTime end) {
    final format = DateFormat('dd.MM.yyyy HH:mm');
    return '${format.format(start)} - ${format.format(end)}';
  }

  /// Строит виджет
  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        Theme.of(context).extension<WeatherAlertInfoScreenStyle>()!;
    final titleBackgroundColor =
        style?.titleBackgroundColor ?? defaultStyle.titleBackgroundColor;
    final titleTextColor = style?.titleTextColor ?? defaultStyle.titleTextColor;
    final infoBackgroundColor =
        style?.infoBackgroundColor ?? defaultStyle.infoBackgroundColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Предупреждения'),
            Text(
              DateFormat('dd.MM.yyyy').format(alertData.start),
              style: textTheme.labelMedium,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: titleBackgroundColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(
                  alertData.event,
                  style: textTheme.bodyLarge?.copyWith(color: titleTextColor),
                ),
              ),
              const ListDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5),
                child: Text('Дата:', style: textTheme.labelLarge),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: infoBackgroundColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatRange(alertData.start, alertData.end),
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5, top: 16),
                child: Text('Отправитель:', style: textTheme.labelLarge),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: infoBackgroundColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(alertData.senderName, style: textTheme.bodyLarge),
                  ],
                ),
              ),
              const ListDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5),
                child: Text('Сообщение:', style: textTheme.labelLarge),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: infoBackgroundColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(alertData.description, style: textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
