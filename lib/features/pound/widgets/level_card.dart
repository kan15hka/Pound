import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/pound/creature_page/creatures_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:math' as math;

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      height: media.width * 0.5,
      decoration: BoxDecoration(
        color: TColor.primaryColor2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              // Container(
              //   height: media.width * 0.4,
              //   width: media.width * 0.4,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Transform(
              //         alignment: FractionalOffset.center,
              //         transform: Matrix4.identity()..rotateZ(-0.9 * math.pi),
              //         child: Container(
              //           width: 150,
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: TColor.secondaryColor1),
              //           // decoration: BoxDecoration(
              //           //   borderRadius: BorderRadius.circular(10.0),
              //           //   boxShadow: [
              //           //     BoxShadow(
              //           //         color: Colors.black.withOpacity(0.5),
              //           //         spreadRadius: 30.0,
              //           //         blurRadius: 50.0)
              //           //   ],
              //           // ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                height: media.width * 0.4,
                width: media.width * 0.4,
                child: ModelViewer(
                  loading: Loading.lazy,
                  debugLogging: false,
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  src: 'assets/3d/elephant.glb',
                  //autoRotate: true,
                  //rotationPerSecond: "10deg",
                  cameraControls: false,
                  iosSrc:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Level 1",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
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
                    "Muscle Mammoth",
                    maxLines: 2,
                    style: TextStyle(
                        color: TColor.white.withOpacity(0.7),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                Text(
                  "Pound to unlock new creature.",
                  maxLines: 2,
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 85,
                  height: 25,
                  child: RoundButton(
                    title: "View all",
                    type: RoundButtonType.bgSGradient,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreaturesPage(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
