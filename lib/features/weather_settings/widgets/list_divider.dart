// Flutter imports:
import 'package:flutter/material.dart';

/// Виджет элемента разделителя списка из настроек
class ListDivider extends StatelessWidget {
  /// Конструктор
  const ListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
        color: const Color(0xB0CED7E5),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
