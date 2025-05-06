// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/features/weather_settings/styles/weather_settings_screen_style.dart';
import 'package:weather_app/features/weather_settings/widgets/widgets.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/services/settings/models/models.dart';

/// Виджет экрана настроек приложения
class WeatherSettingsScreen extends StatelessWidget {
  /// Конструктор
  const WeatherSettingsScreen({super.key, this.style});

  /// Стиль экрана
  final WeatherSettingsScreenStyle? style;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    final theme = Theme.of(context);
    final defaultStyle =
        Theme.of(context).extension<WeatherSettingsScreenStyle>()!;
    final titleTextColor = style?.titleTextColor ?? defaultStyle.titleTextColor;

    if (!provider.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...getUnitsSettings(
            theme: theme,
            titleTextColor: titleTextColor,
            provider: provider,
          ),
          const SizedBox(height: 32),
          ...getUISettings(
            theme: theme,
            titleTextColor: titleTextColor,
            provider: provider,
          ),
          const SizedBox(height: 32),
          ...getOtherSettings(
            theme: theme,
            titleTextColor: titleTextColor,
            provider: provider,
            context: context,
          ),
        ],
      ),
    );
  }

  /// Создать список переключателей настроек единиц измерения
  List<Widget> getUnitsSettings({
    required ThemeData theme,
    required Color titleTextColor,
    required SettingsProvider provider,
  }) => [
    Text(
      'Единицы измерения',
      style: theme.textTheme.titleLarge?.copyWith(
        color: titleTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 16),
    ToggleSettingRow(
      title: 'Температура',
      options: const ['°C', 'K', '°F'],
      selectedIndex: TemperatureUnit.values.indexOf(provider.temperatureUnit),
      onChanged: (i) => provider.setTemperatureUnit(TemperatureUnit.values[i]),
    ),
    const ListDivider(),
    ToggleSettingRow(
      title: 'Давление',
      options: const ['гПа', 'мм рт. ст.'],
      selectedIndex: PressureUnit.values.indexOf(provider.pressureUnit),
      onChanged: (i) => provider.setPressureUnit(PressureUnit.values[i]),
    ),
    const ListDivider(),
    ToggleSettingRow(
      title: 'Скорость ветра',
      options: const ['м/с', 'км/ч'],
      selectedIndex: WindSpeedUnit.values.indexOf(provider.windSpeedUnit),
      onChanged: (i) => provider.setWindSpeedUnit(WindSpeedUnit.values[i]),
    ),
  ];

  /// Получить список переключателей настроек пользовательского интерфейса
  List<Widget> getUISettings({
    required ThemeData theme,
    required Color titleTextColor,
    required SettingsProvider provider,
  }) => [
    Text(
      'Интерфейс',
      style: theme.textTheme.titleLarge?.copyWith(
        color: titleTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 16),
    ToggleSettingRow(
      title: 'Тема приложения',
      options: const ['Светлая', 'Тёмная'],
      selectedIndex: ThemeUnit.values.indexOf(provider.themeUnit),
      onChanged: (i) => provider.setThemeUnit(ThemeUnit.values[i]),
    ),
  ];

  /// Получить список переключателей остальных настроек
  List<Widget> getOtherSettings({
    required ThemeData theme,
    required Color titleTextColor,
    required SettingsProvider provider,
    required BuildContext context,
  }) => [
    Text(
      'Другое',
      style: theme.textTheme.titleLarge?.copyWith(
        color: titleTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 16),
    ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('О программе', style: theme.textTheme.bodyMedium),
      trailing: Icon(Icons.arrow_forward_ios, color: theme.iconTheme.color),
      onTap: () {
        Navigator.pushNamed(context, NavigationRoutes.about);
      },
    ),
  ];
}
