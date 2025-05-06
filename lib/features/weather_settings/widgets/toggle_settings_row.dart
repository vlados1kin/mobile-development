// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_settings/styles/toggle_settings_row.dart';

/// Виджет переключателя настроек
class ToggleSettingRow extends StatelessWidget {
  /// Конструктор
  const ToggleSettingRow({
    required this.title,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
    this.style,
  });

  /// Название переключателя
  final String title;

  /// Варианты переключателя
  final List<String> options;

  /// Индекс выбранного варианта
  final int selectedIndex;

  /// Коллбэк по смене выбранного варианта
  final void Function(int) onChanged;

  /// Кастомный стиль виджета
  final ToggleSettingsRowStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<ToggleSettingsRowStyle>()!;

    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final borderWidth = style?.borderWidth ?? defaultStyle.borderWidth;
    final color = style?.color ?? defaultStyle.color;
    final selectedColor = style?.selectedColor ?? defaultStyle.selectedColor;
    final fillColor = style?.fillColor ?? defaultStyle.fillColor;
    final borderColor = style?.borderColor ?? defaultStyle.borderColor;
    final selectedBorderColor =
        style?.selectedBorderColor ?? defaultStyle.selectedBorderColor;

    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.bodyMedium),
        ToggleButtons(
          isSelected: List.generate(options.length, (i) => i == selectedIndex),
          onPressed: onChanged,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderWidth: borderWidth,
          selectedColor: selectedColor,
          fillColor: fillColor,
          color: color,
          borderColor: borderColor,
          selectedBorderColor: selectedBorderColor,
          children:
              options
                  .map(
                    (unit) => SizedBox(
                      height: 20,
                      width: 200 / options.length,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(unit),
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
