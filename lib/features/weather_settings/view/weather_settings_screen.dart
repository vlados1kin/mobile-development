import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather_settings/styles/weather_settings_screen_style.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/services/settings/models/models.dart';

class WeatherSettingsScreen extends StatefulWidget {
  const WeatherSettingsScreen({super.key, this.style});

  final WeatherSettingsScreenStyle? style;

  @override
  State<WeatherSettingsScreen> createState() => _WeatherSettingsScreenState();
}

class _WeatherSettingsScreenState extends State<WeatherSettingsScreen> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: const Text('Настройки'),
          centerTitle: true,
          backgroundColor: theme.colorScheme.surface.withOpacity(0.9),
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, kToolbarHeight + 32, 24, 32),
            child: Column(
              children: [
                // Иконка
                Hero(
                  tag: 'app_icon',
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadowColor.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.settings,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Заголовок
                Text(
                  'Настройки',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 6),

                // Описание
                Text(
                  'Настройте параметры вашего приложения.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
                ),
                const SizedBox(height: 40),

                // Раздел настроек единиц измерения
                _buildGlassSection(
                  context,
                  title: 'Единицы измерения',
                  children: [
                    _buildActionTile(
                      icon: Icons.thermostat_outlined,
                      title: 'Температура',
                      onTap: () {
                        _showUnitSelectionDialog(
                          context,
                          'Температура',
                          const ['°C', 'K', '°F'],
                              (selectedIndex) => provider.setTemperatureUnit(TemperatureUnit.values[selectedIndex]),
                          TemperatureUnit.values.indexOf(provider.temperatureUnit),
                        );
                      },
                    ),
                    _buildActionTile(
                      icon: Icons.speed_outlined,
                      title: 'Скорость ветра',
                      onTap: () {
                        _showUnitSelectionDialog(
                          context,
                          'Скорость ветра',
                          const ['м/с', 'км/ч'],
                              (selectedIndex) => provider.setWindSpeedUnit(WindSpeedUnit.values[selectedIndex]),
                          WindSpeedUnit.values.indexOf(provider.windSpeedUnit),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Раздел настроек темы
                _buildGlassSection(
                  context,
                  title: 'Тема интерфейса',
                  children: [
                    _buildActionTile(
                      icon: Icons.light_mode_outlined,
                      title: 'Светлая тема',
                      onTap: () => provider.setThemeUnit(ThemeUnit.light),
                    ),
                    _buildActionTile(
                      icon: Icons.dark_mode_outlined,
                      title: 'Тёмная тема',
                      onTap: () => provider.setThemeUnit(ThemeUnit.dark),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Раздел "О программе"
                _buildGlassSection(
                  context,
                  title: 'О программе',
                  children: [
                    _buildActionTile(
                      icon: Icons.info_outline,
                      title: 'О программе',
                      onTap: () => Navigator.pushNamed(context, NavigationRoutes.about),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUnitSelectionDialog(
      BuildContext context,
      String title,
      List<String> options,
      ValueChanged<int> onChanged,
      int initialIndex,
      ) {
    showDialog<int>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Скругленные углы для iOS-стиля
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ...List.generate(
                  options.length,
                      (index) => GestureDetector(
                    onTap: () {
                      onChanged(index);
                      Navigator.of(context).pop(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: index == initialIndex
                            ? theme.colorScheme.primaryContainer
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        options[index],
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: index == initialIndex
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildGlassSection(BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.5),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.05),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
      onTap: onTap,
    );
  }
}
