import 'package:flutter/material.dart';

import 'package:weather_app/features/weather_day_forecast/styles/weather_day_forecast_screen.dart';
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_forecast/widgets/weather_list_elem.dart';

/// Виджет экрана почасового прогноза
class WeatherDayForecastScreen extends StatelessWidget {
  /// Конструктор
  const WeatherDayForecastScreen({
    required this.dayData,
    required this.forecast,
    super.key,
    this.style,
  });

  /// Информация о прогнозе
  final WeatherData dayData;

  /// Список почасового прогноза
  final List<WeatherData> forecast;

  /// Кастомный стиль
  final WeatherDayForecastScreenStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle =
    Theme.of(context).extension<WeatherDayForecastScreenStyle>()!;

    final titleStyle = style?.titleStyle ?? defaultStyle.titleStyle;
    final subtitleStyle = style?.subtitleStyle ?? defaultStyle.subtitleStyle;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center( // Центрируем весь блок текста
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Центрируем колонку
            children: [
              Text('Погода на ${dayData.subtitle}', style: titleStyle),
              Text(dayData.title!, style: subtitleStyle),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: forecast.length,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => WeatherListElem(weatherData: forecast[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}