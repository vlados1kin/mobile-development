// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_settings/providers/providers.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/screen_factory/screen_factory.dart';
import 'package:weather_app/services/settings/models/models.dart';
import 'package:weather_app/services/settings/settings_service.dart';
import 'package:weather_app/services/weather/weather.dart';
import 'package:weather_app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  ScreenFactory().camera = firstCamera;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(SettingsService())..loadSettings(),
        ),
        ChangeNotifierProvider(
          create:
              (_) => WeatherProvider(
                service: WeatherService.instance,
                locationService: LocationService.instance,
              )..init(),
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}

/// Главный виджет приложения
class WeatherApp extends StatelessWidget {
  /// Конструктор
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        final theme = switch (settingsProvider.themeUnit) {
          ThemeUnit.light => dayTheme,
          ThemeUnit.dark => darkTheme,
        };

        return MaterialApp(
          theme: theme,
          routes: MainNavigationRouter().routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
