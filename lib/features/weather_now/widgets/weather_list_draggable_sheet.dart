// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_forecast/widgets/weather_list.dart';
import 'package:weather_app/features/weather_now/styles/weather_list_dragable_sheet_style.dart';

/// Виджет выдвижного списка прогноза погоды
class WeatherListDraggableSheet extends StatelessWidget {
  /// Конструктор
  const WeatherListDraggableSheet({
    required this.weatherList,
    super.key,
    this.style,
  });

  /// Список прогоза погоды
  final Map<WeatherData, List<WeatherData>> weatherList;

  /// Кастомный стиль виджета
  final WeatherListDraggableSheetStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        Theme.of(context).extension<WeatherListDraggableSheetStyle>()!;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;

    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      maxChildSize: 0.82,
      snap: true,
      snapSizes: const [0.28, 0.82],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 8),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFCED7E5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Flexible(
                child: WeatherList(
                  weatherDataList: weatherList,
                  scrollController: scrollController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
