import 'package:fitness/common/widgets/other/title_subtitle_cell.dart';
import 'package:flutter/material.dart';

class HeightWeightAgeCard extends StatelessWidget {
  const HeightWeightAgeCard({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
  });
  final int height, weight, age;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TitleSubtitleCell(
            title: "${height}cm",
            subtitle: "Height",
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TitleSubtitleCell(
            title: "${weight}kg",
            subtitle: "Weight",
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TitleSubtitleCell(
            title: "${age}yo",
            subtitle: "Age",
          ),
        ),
      ],
    );
  }
}
