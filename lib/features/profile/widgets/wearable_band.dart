import 'package:fitness/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class WearableBandWidget extends StatelessWidget {
  const WearableBandWidget({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: media.width * 0.3,
              height: media.width * 0.3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                  shape: BoxShape.circle),
            ),
            Image.asset(
              "assets/img/miband.png",
              height: media.width * 0.3625,
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wearable",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)
                            .createShader(Rect.fromLTRB(
                                0, 0, bounds.width, bounds.height));
                      },
                      child: Text(
                        "Mi Band 4",
                        style: TextStyle(
                            color: TColor.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                    Text(
                      "You are now connected to Mi Band 4",
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
