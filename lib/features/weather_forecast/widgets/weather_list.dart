// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_day_forecast/view/weather_day_forecast_screen.dart';
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_forecast/widgets/weather_list_elem.dart';

/// Виджет списка прогноза погоды
class WeatherList extends StatelessWidget {
  /// Конструктор
  const WeatherList({
    required this.weatherDataList,
    required this.scrollController,
    super.key,
  });

  /// Прогноз прогоды по дням
  final Map<WeatherData, List<WeatherData>> weatherDataList;

  /// Контроллер прокрутки
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: weatherDataList.length,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemBuilder:
          (context, index) => WeatherListElem(
            weatherData: weatherDataList.keys.toList()[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<WeatherDayForecastScreen>(
                  builder:
                      (context) => WeatherDayForecastScreen(
                        dayData: weatherDataList.keys.toList()[index],
                        forecast:
                            weatherDataList[weatherDataList.keys
                                .toList()[index]] ??
                            [],
                      ),
                ),
              );
            },
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
