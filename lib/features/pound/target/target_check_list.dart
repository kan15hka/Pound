import 'dart:collection';

import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/common/widgets/card/nft_market_card.dart';
import 'package:fitness/features/pound/maps/map_view.dart';
import 'package:fitness/features/pound/reward/rewards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class TargetCheckListCard extends StatelessWidget {
  const TargetCheckListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: media.width * 0.05, horizontal: media.width * 0.05),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Column(
        children: [
          SimpleAnimationProgressBar(
            width: media.width * 0.85,
            height: media.width * 0.07,
            backgroundColor: Colors.grey.shade100,
            foregrondColor: Colors.purple,
            ratio: 0.5,
            direction: Axis.horizontal,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 3),
            borderRadius: BorderRadius.circular(15),
            gradientColor: LinearGradient(
                colors: TColor.primaryG,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Level X",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Complete these targets to unlock levels and win nfts",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                TargetWidget(
                  title: "Burn 1000 Calories.",
                  subTitle: "Burn 1000 calories by cardio or workout",
                  checkValue: true,
                ),
                TargetWidget(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapCardioGoView())),
                  title: "Cross 10km.",
                  subTitle: "Walk or run 10kms",
                  checkValue: false,
                ),
                TargetWidget(
                  title: "Good Sleep.",
                  subTitle: "Have a good sleep for 8hours or more",
                  checkValue: true,
                )
              ],
            )
          ]),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              width: media.width * 0.5,
              height: 40.0,
              child: RoundButton(
                  title: "Pound",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RewardsView()));
                  }))
        ],
      ),
    );
  }
}

class TargetWidget extends StatelessWidget {
  const TargetWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.checkValue,
    this.onTap,
  });
  final String title, subTitle;
  final bool checkValue;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: TColor.primaryColor2.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            TargetChecBox(
              checkValue: checkValue,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subTitle,
                    maxLines: 3,
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Iconsax.arrow_right_3),
            )
          ],
        ),
      ),
    );
  }
}

class TargetChecBox extends StatelessWidget {
  const TargetChecBox({
    super.key,
    required this.checkValue,
  });
  final bool checkValue;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // checkColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.selected)) {
        //     return TColors.white;
        //   } else {
        //     return TColors.black;
        //   }
        // }),
        checkColor: TColor.white,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return TColor.primaryColor1;
          } else {
            return Colors.transparent;
          }
        }),
        value: checkValue,
        onChanged: (value) {});
  }
}
