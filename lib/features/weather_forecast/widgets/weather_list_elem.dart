import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather_forecast/data/weather_forecast_data.dart';
import 'package:weather_app/features/weather_forecast/styles/weather_list_elem_style.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/services/settings/models/models.dart';

/// Виджет элемента списка прогноза погоды
class WeatherListElem extends StatelessWidget {
  const WeatherListElem({
    required this.weatherData,
    super.key,
    this.onTap,
    this.style,
  });

  final WeatherData weatherData;
  final VoidCallback? onTap;
  final WeatherListElemStyle? style;

  String getWeatherIconPath(String iconCode) {
    return 'assets/images/png/$iconCode.png';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = Theme.of(context).extension<WeatherListElemStyle>()!;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor = style?.backgroundColor ?? defaultStyle.backgroundColor;

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

    final isDark = theme.brightness == Brightness.dark;

    // Цвет текста для выбранной темы
    final textColor = isDark ? Colors.white : Colors.blue[800];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: isDark ? Colors.grey[850] : Colors.white, // Белый фон для светлой темы
        ),
        padding: padding,
        child: Row(
          children: [
            // Маленький прямоугольник слева для иконки
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue, // Цвет фона иконки
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                getWeatherIconPath(weatherData.icon),
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 16), // Отступ между иконкой и текстом

            // Большой прямоугольник справа для текста
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🗓 Дата и "сегодня"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weatherData.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (weatherData.subtitle != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            weatherData.subtitle!,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: textColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),

                    // 🌤 Компактная информация: температура | ветер и давление
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Температура
                        if (temperature != null)
                          Text(
                            '$temperature$temperatureSign',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        else
                          Text(
                            '$minTemperature..$maxTemperature$temperatureSign',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                        // Ветер и давление
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${wind.toStringAsFixed(1)} $speedSign ${weatherData.windDir}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: textColor,
                              ),
                            ),
                            Text(
                              '$pressure $pressureSign',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}