// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/location/data/location_data.dart';
import 'package:weather_app/features/location/styles/location_list_elem_style.dart';
import 'package:weather_app/features/weather_forecast/styles/weather_list_elem_style.dart';

/// Виджет для отображения элемента списка локаций
class LocationsListElem extends StatelessWidget {
  /// Конструктор
  const LocationsListElem({
    required this.locationData,
    super.key,
    this.onTap,
    this.style,
  });

  /// Данные о локации
  final LocationData locationData;

  /// Обработчик нажатия
  final VoidCallback? onTap;

  /// Стиль элемента списка
  final WeatherListElemStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultStyle = Theme.of(context).extension<LocationsListElemStyle>()!;

    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;
    final padding = style?.padding ?? defaultStyle.padding;
    final backgroundColor =
        style?.backgroundColor ?? defaultStyle.backgroundColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: backgroundColor,
        ),
        padding: padding,
        child: Text(
          '${locationData.city}, ${locationData.country}',
          style: theme.textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
