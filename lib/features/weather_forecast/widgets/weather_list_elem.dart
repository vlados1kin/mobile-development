// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_forecast/styles/weather_list_elem_style.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/services/settings/models/models.dart';

/// Виджет элемента списка прогноза погоды
class WeatherListElem extends StatelessWidget {
  /// Конструктор
  const WeatherListElem({
    required this.weatherData,
    super.key,
    this.onTap,
    this.style,
  });

  /// Информация о прогнозе погоды
  final WeatherData weatherData;

  /// Коллбэк нажатия на элемент
  final VoidCallback? onTap;

  /// Кастомный стиль элемента
  final WeatherListElemStyle? style;

  /// Возвращать путь к иконке по коду
  String getWeatherIconPath(String iconCode) {
    return 'assets/images/png/$iconCode.png';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = Theme.of(context).extension<WeatherListElemStyle>()!;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    final provider = Provider.of<SettingsProvider>(context);

    final wind = switch (provider.windSpeedUnit) {
      WindSpeedUnit.mps => weatherData.windM,
      WindSpeedUnit.kph => weatherData.windK,
    };

    final speedSign = switch (provider.windSpeedUnit) {
      WindSpeedUnit.mps => 'м/с',
      WindSpeedUnit.kph => 'км/ч',
    };

    final pressure = switch (provider.pressureUnit) {
      PressureUnit.hpa => weatherData.pressureP,
      PressureUnit.mmHg => weatherData.pressureM,
    };

    final pressureSign = switch (provider.pressureUnit) {
      PressureUnit.hpa => 'гПа',
      PressureUnit.mmHg => 'мм рт. ст.',
    };

    final temperature = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => weatherData.temperatureC,
      TemperatureUnit.fahrenheit => weatherData.temperatureF,
      TemperatureUnit.kelvin => weatherData.temperatureK,
    };

    final maxTemperature = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => weatherData.maxTemperatureC,
      TemperatureUnit.fahrenheit => weatherData.maxTemperatureF,
      TemperatureUnit.kelvin => weatherData.maxTemperatureK,
    };

    final minTemperature = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => weatherData.minTemperatureC,
      TemperatureUnit.fahrenheit => weatherData.minTemperatureF,
      TemperatureUnit.kelvin => weatherData.minTemperatureK,
    };

    final temperatureSign = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => '°C',
      TemperatureUnit.fahrenheit => '°F',
      TemperatureUnit.kelvin => 'K',
    };

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: backgroundColor,
        ),
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child:
                      weatherData.subtitle != null
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weatherData.title,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: textColor,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 2),
                              ),
                              Text(
                                weatherData.subtitle!,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: textColor.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          )
                          : Text(
                            weatherData.title,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: textColor,
                            ),
                          ),
                ),
                const Padding(padding: EdgeInsets.only(right: 20)),
                Image.asset(
                  getWeatherIconPath(weatherData.icon),
                  width: 50,
                  height: 50,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(Icons.error),
                ),
                const Padding(padding: EdgeInsets.only(right: 20)),
                if (temperature != null) ...[
                  Text(
                    '$temperature$temperatureSign',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                ] else ...[
                  Text(
                    '$minTemperature..$maxTemperature$temperatureSign',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$pressure $pressureSign',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: textColor.withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  '${wind.toStringAsFixed(1)} $speedSign ${weatherData.windDir}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: textColor.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
