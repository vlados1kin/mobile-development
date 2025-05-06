// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/screen_factory/screen_factory.dart';

/// Экран с навигационным баром
class MainNavigationScreen extends StatefulWidget {
  /// Конструктор
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final _screenFactory = ScreenFactory();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Погода',
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            label: 'Экология',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Настройки',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          _screenFactory.makeWeatherNowScreen(),
          _screenFactory.makeWeatherEcologyScreen(),
          _screenFactory.makeSettingsScreen(),
        ],
      ),
    );
  }
}
