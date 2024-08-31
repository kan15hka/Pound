import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/pound/creature_page/creatures_page.dart';
import 'package:fitness/features/pound/target/target_check_list.dart';
import 'package:fitness/features/pound/target/target_rewards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class NextTarget extends StatefulWidget {
  const NextTarget({super.key});

  @override
  State<NextTarget> createState() => _NextTargetState();
}

class _NextTargetState extends State<NextTarget> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageAppBar(title: "Next Target"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Target List Card
            TargetCheckListCard(),

            //Rewards
            TargetRewardsWidget(),
          ],
        ),
      ),
    );
  }
}
