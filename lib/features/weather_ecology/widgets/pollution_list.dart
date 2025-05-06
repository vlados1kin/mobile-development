// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_ecology/widgets/pollution_list_elem.dart';

/// Список элементов данных загрязнений.
class PollutionList extends StatelessWidget {
  /// Создаёт виджет со списком данных загрязнений.
  const PollutionList({required this.pollutionDataList, super.key});

  /// Данные по загрязнениям.
  final List<PollutionData> pollutionDataList;

  /// Строит вертикальный список с элементами загрязнения.
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pollutionDataList.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) =>
              PollutionListElem(pollutionData: pollutionDataList[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
