import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class WaterIntakeCard extends StatelessWidget {
  WaterIntakeCard({super.key});
  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      height: media.width * 1.025,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          SimpleAnimationProgressBar(
            height: media.width * 0.85,
            width: media.width * 0.07,
            backgroundColor: Colors.grey.shade100,
            foregrondColor: Colors.purple,
            ratio: 0.5,
            direction: Axis.vertical,
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Water Intake",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: TColor.primaryG,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  "4 Liters",
                  style: TextStyle(
                      color: TColor.white.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Real time updates",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: waterArr.map((wObj) {
                  var isLast = wObj == waterArr.last;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: TColor.secondaryColor1.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          if (!isLast)
                            DottedDashedLine(
                                height: media.width * 0.078,
                                width: 0,
                                dashColor:
                                    TColor.secondaryColor1.withOpacity(0.5),
                                axis: Axis.vertical)
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wObj["title"].toString(),
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 10,
                            ),
                          ),
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                      colors: TColor.secondaryG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)
                                  .createShader(Rect.fromLTRB(
                                      0, 0, bounds.width, bounds.height));
                            },
                            child: Text(
                              wObj["subtitle"].toString(),
                              style: TextStyle(
                                  color: TColor.white.withOpacity(0.7),
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }).toList(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
