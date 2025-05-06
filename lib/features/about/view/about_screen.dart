// Flutter imports:
import 'package:flutter/material.dart';

/// Экран с информацией о программе.
class AboutScreen extends StatelessWidget {
  /// Конструктор класса
  const AboutScreen({super.key});

  /// Строит виджет экрана с информацией о программе.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('О программе')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Это погодное приложение, разработанное в рамках предмета Разработка программного обеспечения для мобильных платформ.\n\n'
          'Разработчики: Кульчинский Даниил, Рачинская Анастасия, Хомельянская Ксения.\n\n'
          'БГУИР 2025',
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}
