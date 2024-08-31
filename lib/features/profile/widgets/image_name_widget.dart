import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:flutter/material.dart';

class ImageNameWidget extends StatelessWidget {
  const ImageNameWidget({
    super.key,
    required this.img,
    required this.username,
    required this.level,
  });
  final String img, username, level;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            img,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Level X",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 70,
          height: 25,
          child: RoundButton(
            title: "Edit",
            type: RoundButtonType.bgGradient,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MiBandView(),
              //   ),
              // );
            },
          ),
        )
      ],
    );
  }
}
