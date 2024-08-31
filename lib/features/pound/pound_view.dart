import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/pound/community/community_page.dart';
import 'package:fitness/features/pound/widgets/level_card.dart';
import 'package:fitness/features/pound/target/next_target.dart';
import 'package:fitness/features/pound/widgets/sole_target_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PoundView extends StatefulWidget {
  const PoundView({super.key});

  @override
  State<PoundView> createState() => _PoundViewState();
}

class _PoundViewState extends State<PoundView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 32000))
      ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PageAppBar(
        title: "Pound",
        isBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: media.width * 0.05,
            ),

            //Level Card to show level
            LevelCard(),

            SizedBox(
              height: media.width * 0.05,
            ),

            Text(
              "Challenges",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: media.width * 0.02,
            ),
            //Sole Target
            SoleTargetCard(),

            SizedBox(
              height: media.width * 0.05,
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: media.width * 0.5,
                ),
                Container(
                  height: media.width * 0.45,
                  decoration: BoxDecoration(
                    color: TColor.primaryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: media.width * 0.4,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Community Challenges",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Compete in community challenges to boost your profile.",
                              maxLines: 3,
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 25.0,
                              width: 75.0,
                              child: RoundButton(
                                  type: RoundButtonType.bgSGradient,
                                  title: "Go",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommunityPage()));
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "assets/img/welcome.png",
                  height: media.width * 0.4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
