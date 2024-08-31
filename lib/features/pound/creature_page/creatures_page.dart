import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/constants/creatures.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/pound/creature_page/creature_details_page.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CreaturesPage extends StatefulWidget {
  CreaturesPage({super.key});

  @override
  State<CreaturesPage> createState() => _CreaturesPageState();
}

class _CreaturesPageState extends State<CreaturesPage> {
  List<Map<String, dynamic>> creaturesList = [];
  @override
  void initState() {
    creaturesList = Creatures.creature.values.toList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PageAppBar(
        title: "Creatures",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: Creatures.creature.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 220),
            itemBuilder: ((context, index) {
              bool colorBool = (index % 2) == 0;
              final fObj = creaturesList[index];
              return index > 4
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: colorBool
                                    ? TColor.primaryG
                                    : TColor.secondaryG,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)
                            .createShader(Rect.fromLTRB(
                                0, 0, bounds.width, bounds.height));
                      },
                      child: CreatureCard(
                          colorBool: colorBool, fObj: fObj, media: media),
                    )
                  : CreatureCard(
                      colorBool: colorBool, fObj: fObj, media: media);
            })),
      ),
    );
  }
}

class CreatureCard extends StatelessWidget {
  const CreatureCard({
    super.key,
    required this.colorBool,
    required this.fObj,
    required this.media,
  });

  final bool colorBool;
  final Map<String, dynamic> fObj;
  final Size media;

  @override
  Widget build(BuildContext context) {
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
                fObj["img"],
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.cover,
              )
              // Container(
              //   height: media.width * 0.3,
              //   width: media.width * 0.3,
              //   child: ModelViewer(
              //     alt: fObj["title"],
              //     loading: Loading.lazy,
              //     debugLogging: false,
              //     backgroundColor: Color.fromARGB(0, 255, 255, 255),
              //     src: trackers[0]["image"],
              //     //autoRotate: true,
              //     //rotationPerSecond: "10deg",
              //     cameraControls: false,
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Level X",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                        colors: colorBool ? TColor.primaryG : TColor.secondaryG,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)
                    .createShader(
                        Rect.fromLTRB(0, 0, bounds.width, bounds.height));
              },
              child: Text(
                fObj["name"],
                style: TextStyle(
                    color: TColor.white.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
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
                  title: "View",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CreaturesDetailPage(creature: fObj),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
