import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/other/today_target_cell.dart';
import 'package:fitness/features/pound/target/next_target.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SoleTargetCard extends StatelessWidget {
  const SoleTargetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.3),
          TColor.primaryColor1.withOpacity(0.3)
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sole Target",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: TodayTargetCell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NextTarget()));
                  },
                  iconData: Iconsax.next,
                  icon: "assets/img/water.png",
                  value: "Next Target",
                  title: "Complete new targets",
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TodayTargetCell(
                  iconData: Iconsax.save_2,
                  icon: "assets/img/foot.png",
                  value: "History",
                  title: "Completed targets",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
