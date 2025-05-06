// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/location/data/data.dart';
import 'package:weather_app/features/location/styles/styles.dart';
import 'package:weather_app/features/location/widgets/widgets.dart';
import 'package:weather_app/features/main_navigation/providers/providers.dart';

/// Экран выбора локации
class LocationSearchScreen extends StatefulWidget {
  /// Конструктор
  const LocationSearchScreen({super.key, this.style});

  /// Стиль экрана
  final LocationSearchScreenStyle? style;

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_onSearchTextChanged);
  }

  late TextEditingController _textEditingController;
  String _query = '';
  Timer? _debounce;

  void _onSearchTextChanged() {
    final query = _textEditingController.text;

    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        _query = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        Theme.of(context).extension<LocationSearchScreenStyle>()!;
    final titleTextColor =
        widget.style?.titleTextColor ?? defaultStyle.titleTextColor;
    final theme = Theme.of(context);

    final provider = Provider.of<WeatherProvider>(context);
    final currentLocation = provider.currentLocation;
    final locationsList = provider.searchLocation(query: _query);

    return Scaffold(
      appBar: AppBar(title: const Text('Выбор локации')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Текущая локация:',
              style: theme.textTheme.titleLarge?.copyWith(
                color: titleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${currentLocation!.city}, ${currentLocation.country}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            TextField(
              decoration: const InputDecoration(
                hintText: 'Поиск локации...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 16),

            FutureBuilder<List<LocationData>>(
              future: locationsList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Ошибка: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  final locationsList = snapshot.data!;
                  if (locationsList.isNotEmpty) {
                    return Expanded(
                      child: LocationsList(locationsList: locationsList),
                    );
                  } else if (_query.isNotEmpty) {
                    return const Text('Ничего не найдено');
                  }
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
