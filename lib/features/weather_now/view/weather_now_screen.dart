// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_now/data/weather_info.dart';
import 'package:weather_app/features/weather_now/styles/weather_now_screen_style.dart';
import 'package:weather_app/features/weather_now/widgets/weather_list_draggable_sheet.dart';
import 'package:weather_app/features/weather_now/widgets/widgets.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/services/settings/models/models.dart';

/// Виджет домашнего экрана прогноза погоды
class WeatherNowScreen extends StatefulWidget {
  /// Конструктор
  const WeatherNowScreen({super.key, this.style});

  /// Кастомный стиль виджета
  final WeatherNowScreenStyle? style;

  @override
  State<WeatherNowScreen> createState() => _WeatherNowScreenState();
}

class _WeatherNowScreenState extends State<WeatherNowScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    if (weatherProvider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final mainWeatherData = weatherProvider.mainWeather!;

    final defaultStyle = Theme.of(context).extension<WeatherNowScreenStyle>()!;
    final textColor = widget.style?.textColor ?? defaultStyle.textColor;
    final backgroundColor =
        widget.style?.backgroundColor ?? defaultStyle.backgroundColor;

    final theme = Theme.of(context);

    final provider = Provider.of<SettingsProvider>(context);

    final wind = switch (provider.windSpeedUnit) {
      WindSpeedUnit.mps => mainWeatherData.windM,
      WindSpeedUnit.kph => mainWeatherData.windK,
    };

    final speedSign = switch (provider.windSpeedUnit) {
      WindSpeedUnit.mps => 'м/с',
      WindSpeedUnit.kph => 'км/ч',
    };

    final gust = switch (provider.windSpeedUnit) {
      WindSpeedUnit.mps => mainWeatherData.gustM,
      WindSpeedUnit.kph => mainWeatherData.gustK,
    };

    final pressure = switch (provider.pressureUnit) {
      PressureUnit.hpa => mainWeatherData.pressureP,
      PressureUnit.mmHg => mainWeatherData.pressureM,
    };

    final pressureSign = switch (provider.pressureUnit) {
      PressureUnit.hpa => 'гПа',
      PressureUnit.mmHg => 'мм рт. ст.',
    };

    final city =
        Provider.of<WeatherProvider>(context).currentLocation?.city ??
        'Город не найден';

    final day = mainWeatherData.lastUpdate.day.toString().padLeft(2, '0');
    final month = mainWeatherData.lastUpdate.month.toString().padLeft(2, '0');
    final year = mainWeatherData.lastUpdate.year;
    final hour = mainWeatherData.lastUpdate.hour.toString().padLeft(2, '0');
    final minute = mainWeatherData.lastUpdate.minute.toString().padLeft(2, '0');
    final lastUpdate = '$day.$month.$year в $hour:$minute';

    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: backgroundColor,
              expandedHeight: 85,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Обновлено $lastUpdate',
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await weatherProvider.updateWeather();
                      },
                      icon: Icon(Icons.refresh, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(city, style: TextStyle(color: textColor)),
                        Text(
                          mainWeatherData.text,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: textColor.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    iconTheme: IconThemeData(color: textColor),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, NavigationRoutes.alerts);
                        },
                        icon: const Icon(Icons.warning_amber_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoutes.locationSearch,
                          );
                        },
                        icon: const Icon(Icons.location_on_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, NavigationRoutes.camera);
                        },
                        icon: const Icon(Icons.photo_camera_outlined),
                      ),
                    ],
                  ),
                  _buildMainInfo(mainWeatherData),
                  _buildGrid(
                    mainWeatherData,
                    wind,
                    gust,
                    speedSign,
                    pressure,
                    pressureSign,
                  ),
                ],
              ),
            ),
            WeatherListDraggableSheet(weatherList: weatherProvider.forecast),
          ],
        ),
      ),
    );
  }

  Widget _buildMainInfo(MainWeatherData mainWeather) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: WeatherInfo(weatherData: mainWeather),
    );
  }

  Widget _buildGrid(
    MainWeatherData mainWeather,
    double wind,
    double gust,
    String speedSign,
    int pressure,
    String pressureSign,
  ) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.2,
      children: [
        WeatherParamCard(
          icon: Icons.water_drop_outlined,
          title: 'Влажность',
          value: mainWeather.humidity.toString(),
          units: '%',
        ),
        WeatherParamCard(
          icon: Icons.compress,
          title: 'Давление',
          value: pressure.toString(),
          units: pressureSign,
        ),
        WeatherParamCard(
          icon: Icons.wind_power,
          title: 'Ветер',
          value: wind.toStringAsFixed(1),
          units: speedSign,
        ),
        WeatherParamCard(
          icon: Icons.cloud_outlined,
          title: 'Порывы',
          value: gust.toStringAsFixed(1),
          units: speedSign,
        ),
        WeatherParamCard(
          icon: Icons.light_mode_outlined,
          title: 'Рассвет',
          value: '${mainWeather.sunriseHour}ч',
          units: '${mainWeather.sunriseMinute}м',
        ),
        WeatherParamCard(
          icon: Icons.dark_mode_outlined,
          title: 'Закат',
          value: '${mainWeather.sunsetHour}ч',
          units: '${mainWeather.sunsetMinute}м',
        ),
      ],
    );
  }
}
