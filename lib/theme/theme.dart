// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/location/styles/styles.dart';
import 'package:weather_app/features/weather_alert_info/styles/styles.dart';
import 'package:weather_app/features/weather_alerts/styles/styles.dart';
import 'package:weather_app/features/weather_day_forecast/styles/styles.dart';
import 'package:weather_app/features/weather_ecology/styles/styles.dart';
import 'package:weather_app/features/weather_forecast/styles/styles.dart';
import 'package:weather_app/features/weather_now/styles/styles.dart';
import 'package:weather_app/features/weather_settings/styles/toggle_settings_row.dart';
import 'package:weather_app/features/weather_settings/styles/weather_settings_screen_style.dart';

/// Получить текстовую тему в зависимости от темы
TextTheme buildTextTheme(Color color, Color secondary) => TextTheme(
  displayLarge: TextStyle(
    color: color,
    fontSize: 90,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(color: color, fontSize: 70),
  displaySmall: TextStyle(color: color, fontSize: 45),
  titleLarge: TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: TextStyle(color: color, fontSize: 18),
  bodyMedium: TextStyle(color: color, fontSize: 16),
  bodySmall: TextStyle(color: color, fontSize: 14),
  labelLarge: TextStyle(color: secondary, fontSize: 18),
  labelMedium: TextStyle(color: secondary, fontSize: 16),
  labelSmall: TextStyle(color: secondary, fontSize: 14),
  headlineMedium: TextStyle(
    color: color,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(color: color, fontSize: 20),
);

/// Получить темы апп бара в зависимости от темы
AppBarTheme buildAppBarTheme(Color textColor, Color iconColor) => AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  titleTextStyle: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontSize: 24,
  ),
  iconTheme: IconThemeData(color: iconColor),
);

/// Получить темы иконок в зависимости от темы
IconThemeData iconTheme(Color color) => IconThemeData(color: color);

/// Получить расширения в зависимости от темы
Set<ThemeExtension<dynamic>> buildExtensions({required bool isDark}) {
  final secondaryBackground = isDark ? const Color(0xFF212331) : const Color(0xFFEEEFF4);
  final primaryBackground   = isDark ? const Color(0xFF283C65) : const Color(0xFF7999EA);
  final infoBackground      = isDark ? const Color(0xFF2A2D3E) : Colors.white;
  final card                = isDark ? const Color(0xFF314A7E) : Colors.white;
  final mainTextColor       = isDark ? Colors.white : Colors.black87;
  const secondaryTextColor  = Colors.white;
  final titleTextColor      = isDark ? const Color(0xFF6682B8) : const Color(0xFF1C4494);

  return {
    WeatherNowScreenStyle(
      textColor: secondaryTextColor,
      backgroundColor: primaryBackground,
    ),
    WeatherEcologyScreenStyle(
      backgroundColor: primaryBackground,
      textColor: secondaryTextColor,
    ),
    WeatherListDraggableSheetStyle(backgroundColor: secondaryBackground),
    WeatherInfoStyle(textColor: secondaryTextColor),
    WeatherParamCardStyle(
      iconSize: 30,
      borderRadius: 15,
      padding: const EdgeInsets.all(15),
      backgroundColor: card,
      textColor: secondaryTextColor,
    ),
    WeatherListElemStyle(
      borderRadius: 15,
      padding: const EdgeInsets.all(15),
      backgroundColor: card,
      textColor: secondaryTextColor,
    ),
    WeatherDayForecastScreenStyle(
      titleStyle: const TextStyle(fontSize: 24),
      subtitleStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      backgroundColor: secondaryBackground,
    ),
    WeatherAlertInfoScreenStyle(
      backgroundColor: primaryBackground,
      titleBackgroundColor: card,
      titleTextColor: secondaryTextColor,
      infoBackgroundColor: infoBackground,
      infoTextColor: mainTextColor,
    ),
    AirPollutionIndexCardStyle(
      borderRadius: 15,
      padding: const EdgeInsets.all(15),
      backgroundColor: card,
      textColor: secondaryTextColor,
    ),
    const PollutionListElemStyle(
      borderRadius: 15,
      padding: EdgeInsets.all(15),
    ),
    LevelCardStyle(textColor: secondaryTextColor),
    WeatherAlertListElemStyle(
      borderRadius: 15,
      padding: const EdgeInsets.all(15),
      backgroundColor: card,
      textColor: secondaryTextColor,
    ),
    ToggleSettingsRowStyle(
      borderRadius: 6,
      borderWidth: 2,
      selectedColor: Colors.white,
      fillColor: card,
      color: mainTextColor,
      borderColor: isDark ? card : const Color(0xFFCED7E5),
      selectedBorderColor: card,
    ),
    LocationsListElemStyle(
      borderRadius: 15,
      padding: const EdgeInsets.all(15),
      backgroundColor: infoBackground,
    ),
    LocationSearchScreenStyle(titleTextColor: titleTextColor),
    WeatherSettingsScreenStyle(titleTextColor: titleTextColor),
  };
}

/// Получить темы навигации в зависимости от темы
NavigationBarThemeData _navBarTheme(bool isDark) => NavigationBarThemeData(
  backgroundColor: isDark ? const Color(0xFF2A2D3E) : Colors.white,
  indicatorColor: Colors.transparent,
  iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
    return IconThemeData(
      color:
          states.contains(WidgetState.selected)
              ? Colors.blue
              : (isDark ? Colors.white : Colors.grey),
    );
  }),
  labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
    final color =
        states.contains(WidgetState.selected)
            ? Colors.blue
            : (isDark ? Colors.white70 : Colors.grey);
    return TextStyle(color: color, fontWeight: FontWeight.w100);
  }),
);

/// Получить темы для дня
final dayTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'Inter',
  primaryColor: const Color(0xFF7999EA),
  scaffoldBackgroundColor: const Color(0xFFEEEFF4),
  iconTheme: iconTheme(Colors.grey),
  appBarTheme: buildAppBarTheme(Colors.black87, Colors.grey),
  textTheme: buildTextTheme(Colors.black87, Colors.black54),
  navigationBarTheme: _navBarTheme(false),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF7999EA)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerTheme: const DividerThemeData(color: Colors.grey),
  extensions: buildExtensions(isDark: false),
);

/// Получить темы для ночи
final darkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  fontFamily: 'Inter',
  primaryColor: const Color(0xFF7999EA),
  scaffoldBackgroundColor: const Color(0xFF212331),
  iconTheme: iconTheme(Colors.grey[300]!),
  appBarTheme: buildAppBarTheme(Colors.white, Colors.grey[300]!),
  textTheme: buildTextTheme(Colors.white, Colors.grey),
  navigationBarTheme: _navBarTheme(true),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF2A2D3E)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerTheme: const DividerThemeData(color: Colors.grey),
  extensions: buildExtensions(isDark: true),
);
