import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/location/data/data.dart';
import 'package:weather_app/features/location/styles/styles.dart';
import 'package:weather_app/features/location/widgets/widgets.dart';
import 'package:weather_app/features/main_navigation/providers/providers.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key, this.style});
  final LocationSearchScreenStyle? style;

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  late TextEditingController _textEditingController;
  String _query = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_onSearchTextChanged);
  }

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
    final defaultStyle = Theme.of(context).extension<LocationSearchScreenStyle>()!;
    final titleTextColor = widget.style?.titleTextColor ?? defaultStyle.titleTextColor;
    final theme = Theme.of(context);

    final provider = Provider.of<WeatherProvider>(context);
    final currentLocation = provider.currentLocation;
    final locationsList = provider.searchLocation(query: _query);

    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: const Text('Выбор локации')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Выбранный город (центрированный и с увеличенным прямоугольником)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  padding: const EdgeInsets.all(24),  // Увеличенный padding
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[850] : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Выбранный город:',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: titleTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${currentLocation!.city}, ${currentLocation.country}',
                        textAlign: TextAlign.center,  // Центрируем название города
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Поле для поиска (с изменением текста)
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Введите город',  // Изменено на "Введите город"
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: isDark ? Colors.grey[800] : Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Список локаций
              FutureBuilder<List<LocationData>>(
                future: locationsList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Ошибка: ${snapshot.error}');
                  }

                  if (snapshot.hasData) {
                    final locations = snapshot.data!;
                    if (locations.isNotEmpty) {
                      return Expanded(
                        child: LocationsList(locationsList: locations),
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