import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_alerts/data/weather_alert_data.dart';
import 'package:weather_app/features/weather_alerts/widgets/weather_alert_list_elem.dart';

/// Виджет списка предупреждений
class WeatherAlertList extends StatelessWidget {
  /// Конструктор
  const WeatherAlertList({required this.weatherAlertList, super.key});

  /// Список предупреждений
  final List<WeatherAlertData> weatherAlertList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: weatherAlertList.length,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => WeatherAlertListElem(
        alertData: weatherAlertList[index],
        // onTap не передаётся, чтобы отключить переход
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20), // Увеличенный отступ
    );
  }
}