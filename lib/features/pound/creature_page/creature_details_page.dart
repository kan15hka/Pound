import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CreaturesDetailPage extends StatelessWidget {
  const CreaturesDetailPage({super.key, required this.creature});
  final Map<String, dynamic> creature;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PageAppBar(
        title: "Creature Details",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: media.width,
              width: media.width,
              // color: Colors.red,
              child: ModelViewer(
                loading: Loading.lazy,
                debugLogging: false,
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                src: creature["3d"],
                autoRotate: true,
                rotationPerSecond: "10deg",
                cameraControls: false,
                iosSrc:
                    'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Level X",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ShaderMask(
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
                creature["name"],
                style: TextStyle(
                    color: TColor.white.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.1),
            child: Text(
              "A Furious creature unlocked in level X it has a distinctive feature of wildnessand higher agility",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
