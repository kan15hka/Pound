import 'package:fitness/features/home/widgets/bmi_card.dart';
import 'package:fitness/features/home/widgets/calories_card.dart';
import 'package:fitness/features/home/widgets/heart_rate_card.dart';
import 'package:fitness/features/home/widgets/latest_workout.dart';
import 'package:fitness/features/home/widgets/sleep_card.dart';
import 'package:fitness/features/home/widgets/today_target_card.dart';
import 'package:fitness/features/home/widgets/tracker_list.dart';
import 'package:fitness/features/home/widgets/username_header.dart';
import 'package:fitness/features/home/widgets/water_intake_card.dart';
import 'package:fitness/features/home/widgets/workout_progress_card.dart';
import 'package:fitness/features/home/widgets/workout_progress_title.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../common/constants/color_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Username and notifications
                UserNameHeader(),

                SizedBox(
                  height: media.width * 0.05,
                ),

                //Body Mass Index Card
                BMICard(),

                SizedBox(
                  height: media.width * 0.05,
                ),

                //Today Target Card
                TodayTargetCard(),

                SizedBox(
                  height: media.width * 0.05,
                ),

                Text(
                  "Activity Status",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),

                SizedBox(
                  height: media.width * 0.02,
                ),

                //Haert rate graph
                HeartRateCard(),

                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  children: [
                    //Water Intake Card
                    Expanded(child: WaterIntakeCard()),

                    SizedBox(
                      width: media.width * 0.05,
                    ),

                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Sleep Card
                        SleepCard(),

                        SizedBox(
                          height: media.width * 0.05,
                        ),

                        //Calories Card
                        CaloriesCard(),
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),

                //Workout Progress title with time dropdown
                WorkoutProgressTitle(),

                SizedBox(
                  height: media.width * 0.05,
                ),

                //Workout progress graph
                WorkOutProgressCard(),

                SizedBox(
                  height: media.width * 0.05,
                ),

                Text(
                  "Health Tracker",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.02,
                ),

                //Tracker Grid View
                TrackerList(),

                SizedBox(
                  height: media.width * 0.05,
                ),
                //Latest Workout List
                LatestWorkout(),

                SizedBox(
                  height: media.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
