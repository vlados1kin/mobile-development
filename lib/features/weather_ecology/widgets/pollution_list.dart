import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_ecology/data/data.dart';
import 'package:weather_app/features/weather_ecology/widgets/pollution_list_elem.dart';

/// Сетка элементов данных загрязнений.
class PollutionList extends StatelessWidget {
  const PollutionList({required this.pollutionDataList, super.key});

  final List<PollutionData> pollutionDataList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: pollutionDataList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // две карточки в ряд
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return PollutionListElem(pollutionData: pollutionDataList[index]);
      },
    );
  }
}
