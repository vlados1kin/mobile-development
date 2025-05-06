// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/weather_now/data/weather_info.dart';
import 'package:weather_app/features/weather_now/styles/weather_info_style.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/services/settings/models/models.dart';

/// Виджет карточки с ифнормацией о погоде
class WeatherInfo extends StatelessWidget {
  /// Конструктор
  const WeatherInfo({required this.weatherData, super.key, this.style});

  /// Информация о погоде
  final MainWeatherData weatherData;

  /// Кастомный стиль элемента
  final WeatherInfoStyle? style;

  /// Возвращает путь к иконе по её коду
  String getWeatherIconPath(String iconCode) {
    return 'assets/images/png/$iconCode.png';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);

    final temperature = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => weatherData.temperatureC,
      TemperatureUnit.fahrenheit => weatherData.temperatureF,
      TemperatureUnit.kelvin => weatherData.temperatureK,
    };

    final temperatureSign = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => '°C',
      TemperatureUnit.fahrenheit => '°F',
      TemperatureUnit.kelvin => 'K',
    };

    final feelsLike = switch (provider.temperatureUnit) {
      TemperatureUnit.celsius => weatherData.feelsLikeC,
      TemperatureUnit.fahrenheit => weatherData.feelsLikeF,
      TemperatureUnit.kelvin => weatherData.feelsLikeK,
    };

    final defaultStyle = Theme.of(context).extension<WeatherInfoStyle>()!;
    final textColor = style?.textColor ?? defaultStyle.textColor;

    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$temperature',
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: textColor,
                  ),
                ),
                Text(
                  temperatureSign,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            ),
            Text(
              'Ощущается как $feelsLike$temperatureSign',
              style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
            ),
          ],
        ),
        Image.asset(
          getWeatherIconPath(weatherData.icon),
          width: 160,
          height: 160,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ],
    );
  }
}
