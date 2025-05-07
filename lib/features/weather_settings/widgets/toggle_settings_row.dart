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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultStyle = theme.extension<ToggleSettingsRowStyle>()!;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final selectedColor = style?.selectedColor ?? theme.colorScheme.onPrimary;
    final unselectedColor = style?.color ?? theme.colorScheme.onSurface;
    final backgroundColor = style?.fillColor ??
        (isDark ? Colors.white10 : Colors.grey.shade200);
    final selectedBackgroundColor =
    theme.colorScheme.primary.withOpacity(isDark ? 0.3 : 0.1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: List.generate(options.length, (i) {
              final isSelected = i == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? selectedBackgroundColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Center(
                      child: Text(
                        options[i],
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color:
                          isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
