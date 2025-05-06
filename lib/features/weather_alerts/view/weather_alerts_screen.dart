// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_alerts/widgets/widgets.dart';

/// Виджет экрана предупреждений
class WeatherAlertsScreen extends StatelessWidget {
  /// Конструктом
  const WeatherAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alertList = Provider.of<WeatherProvider>(context).alertList;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Предупреждения')),
      body:
          alertList.isNotEmpty
              ? WeatherAlertList(weatherAlertList: alertList)
              : Center(
                child: Text(
                  'Нет доступных предупреждений',
                  style: textTheme.labelMedium,
                ),
              ),
    );
  }
}
