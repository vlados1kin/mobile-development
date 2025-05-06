// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/location/data/location_data.dart';
import 'package:weather_app/features/location/widgets/locations_list_elem.dart';
import 'package:weather_app/features/main_navigation/providers/providers.dart';

/// Виджет для отображения списка локаций
class LocationsList extends StatelessWidget {
  /// Конструктор
  const LocationsList({required this.locationsList, super.key});

  /// Список локаций
  final List<LocationData> locationsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: locationsList.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => LocationsListElem(
            locationData: locationsList[index],
            onTap: () {
              Provider.of<WeatherProvider>(
                context,
                listen: false,
              ).saveCurrentLocation(locationsList[index]);
            },
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
