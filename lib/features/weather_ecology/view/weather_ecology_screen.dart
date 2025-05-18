import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_ecology/widgets/pollution_list.dart';
import 'package:weather_app/features/weather_ecology/widgets/widgets.dart';

/// Экран с данными об общем индексе и отдельных показателях загрязнения воздуха.
class WeatherEcologyScreen extends StatelessWidget {
  const WeatherEcologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider      = Provider.of<WeatherProvider>(context);
    final pollutionList = provider.pollutionList;
    final index         = provider.defraIndex ?? 1;

    int valueIndex;
    if      (index > 9) {
      valueIndex = 5;
    } else if (index > 6) valueIndex = 4;
    else if (index > 3) valueIndex = 3;
    else if (index > 1) valueIndex = 2;
    else                valueIndex = 1;

    final theme = Theme.of(context);
    final cs    = theme.colorScheme;
    final tt    = theme.textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface.withOpacity(0.9),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Состояние воздуха',
          style: tt.headlineSmall?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AirPollutionIndexCard(value: index, valueIndex: valueIndex),

              const SizedBox(height: 12),

              Expanded(
                child: PollutionList(pollutionDataList: pollutionList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
