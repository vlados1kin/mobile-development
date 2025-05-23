import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/screen_factory/screen_factory.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final _screenFactory = ScreenFactory();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBody: true, // Для эффекта плавающей навигации
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          _screenFactory.makeWeatherNowScreen(),
          _screenFactory.makeWeatherEcologyScreen(),
          _screenFactory.makeSettingsScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withOpacity(0.6)
                    : Colors.white.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBarText('Прогноз', 0),
                  _buildBarText('Экология', 1),
                  _buildBarText('Настройки', 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarText(String label, int index) {
    final isSelected = currentPageIndex == index;
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.5);

    return TextButton(
      onPressed: () {
        setState(() {
          currentPageIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}