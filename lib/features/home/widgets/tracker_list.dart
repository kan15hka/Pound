import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/home/meal_planner/meal_planner_view.dart';
import 'package:fitness/features/home/photo_progress/photo_progress_view.dart';
import 'package:fitness/features/home/sleep_tracker/sleep_tracker_view.dart';
import 'package:fitness/features/home/workout_tracker/workout_tracker_view.dart';
import 'package:flutter/material.dart';

class TrackerList extends StatelessWidget {
  TrackerList({super.key});
  final List<Map<String, dynamic>> trackers = [
    {
      "title": "Workout Tracker",
      "page": WorkoutTrackerView(),
      "image": "assets/img/barbell.png",
    },
    {
      "title": "Meal Planner",
      "page": MealPlannerView(),
      "image": "assets/img/m_3.png",
    },
    {
      "title": "Sleep Tracker",
      "page": SleepTrackerView(),
      "image": "assets/img/sleep_schedule.png",
    },
    {
      "title": "Progress Tracker",
      "page": PhotoProgressView(),
      "image": "assets/img/progress_each_photo.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: media.height * 0.575,
          width: media.width,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: trackers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 220),
              itemBuilder: ((context, index) {
                final fObj = trackers[index] as Map? ?? {};
                bool colorBool = (index % 2) == 0;
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colorBool
                            ? [
                                TColor.primaryColor2.withOpacity(0.5),
                                TColor.primaryColor1.withOpacity(0.5)
                              ]
                            : [
                                TColor.secondaryColor2.withOpacity(0.5),
                                TColor.secondaryColor1.withOpacity(0.5)
                              ],
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(75),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            fObj["image"].toString(),
                            width: media.width * 0.3,
                            height: media.width * 0.25,
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          fObj["title"],
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          fObj["title"],
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: 90,
                          height: 25,
                          child: RoundButton(
                              fontSize: 12,
                              type: colorBool
                                  ? RoundButtonType.bgGradient
                                  : RoundButtonType.bgSGradient,
                              title: "Select",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => fObj["page"],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }
}
