import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/other/workout_row.dart';
import 'package:fitness/features/home/finished_workout_view.dart';
import 'package:flutter/material.dart';

class LatestWorkout extends StatelessWidget {
  LatestWorkout({
    super.key,
  });

  List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/img/Workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/img/Workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/img/Workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Latest Workout",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See More",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: lastWorkoutArr.length,
            itemBuilder: (context, index) {
              var wObj = lastWorkoutArr[index] as Map? ?? {};
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinishedWorkoutView(),
                      ),
                    );
                  },
                  child: WorkoutRow(wObj: wObj));
            }),
      ],
    );
  }
}
