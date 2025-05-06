// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_ecology/styles/weather_ecology_screen_style.dart';
import 'package:weather_app/features/weather_ecology/widgets/pollution_list.dart';
import 'package:weather_app/features/weather_ecology/widgets/widgets.dart';

/// Экран, отображающий общий индекс загрязнения и показатели по элементам.
class WeatherEcologyScreen extends StatelessWidget {
  /// Создаёт экран экологических показателей.
  const WeatherEcologyScreen({super.key, this.style});

  /// Стилизация экрана.
  final WeatherEcologyScreenStyle? style;

  /// Строит интерфейс экрана с общим индексом загрязнения и списком показателей.
  @override
  Widget build(BuildContext context) {
    final city =
        Provider.of<WeatherProvider>(context).currentLocation?.city ??
        'Город не найден';
    final pollutionList = Provider.of<WeatherProvider>(context).pollutionList;
    final defraIndex = Provider.of<WeatherProvider>(context).defraIndex ?? 1;

    var valueIndex = 1;
    if (defraIndex > 1 && defraIndex <= 3) {
      valueIndex = 2;
    } else if (defraIndex > 3 && defraIndex <= 6) {
      valueIndex = 3;
    } else if (defraIndex > 6 && defraIndex <= 9) {
      valueIndex = 4;
    } else if (defraIndex > 9) {
      valueIndex = 5;
    }

    final defaultStyle =
        Theme.of(context).extension<WeatherEcologyScreenStyle>()!;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Экология', style: TextStyle(color: textColor)),
            Text(
              city,
              style: textTheme.labelMedium?.copyWith(
                color: textColor.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Индекс загрязнения воздуха',
              style: textTheme.titleLarge?.copyWith(color: textColor),
            ),
            const SizedBox(height: 16),
            AirPollutionIndexCard(value: defraIndex, valueIndex: valueIndex),
            const SizedBox(height: 15),
            Text(
              'Отдельные показатели',
              style: textTheme.titleLarge?.copyWith(color: textColor),
            ),
            Expanded(child: PollutionList(pollutionDataList: pollutionList)),
          ],
        ),
      ),
    );
  }
}
