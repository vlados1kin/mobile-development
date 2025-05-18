import 'package:flutter/material.dart';

/// Виджет элемента разделителя списка из настроек
class ListDivider extends StatelessWidget {
  /// Конструктор
  const ListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
              Colors.white.withOpacity(0.05),
              Colors.white.withOpacity(0.02),
            ]
                : [
              Colors.black.withOpacity(0.05),
              Colors.black.withOpacity(0.02),
            ],
          ),
        ),
      ),
    );
  }
}
