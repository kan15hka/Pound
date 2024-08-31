import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/constants/creatures.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({super.key});
  List<Map<String, dynamic>> creaturesList = [];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    creaturesList = Creatures.creature.values.toList();

    return Scaffold(
      backgroundColor: TColor.primaryColor2,
      appBar: PageAppBar(
        title: "Community Challenges",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  height: media.height * 0.3,
                  decoration: BoxDecoration(
                    color: TColor.primaryColor2.withOpacity(0.3),

                    // gradient: LinearGradient(
                    //     begin: Alignment.bottomCenter,
                    //     end: Alignment.topCenter,
                    //     colors: TColor.primaryG),
                  ),
                ),
                Image.asset(
                  "assets/img/sleep_grap.png",
                  height: media.height * 0.25,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LeaderBoardLeadingCard(
                      winNum: "2",
                      name: "tylerx",
                      color: const Color.fromARGB(255, 132, 231, 136),
                      height: 50.0,
                    ),
                    LeaderBoardLeadingCard(
                      winNum: "1",
                      name: "kani5hka",
                      color: const Color.fromARGB(255, 231, 133, 127),
                      height: 75.0,
                    ),
                    LeaderBoardLeadingCard(
                      winNum: "3",
                      name: "shrux",
                      color: const Color.fromARGB(255, 255, 242, 128),
                      height: 25.0,
                    )
                  ],
                ),
              ],
            ),
            Container(
                width: media.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Stack(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            padding: EdgeInsets.symmetric(
                                vertical: 7.5, horizontal: 10.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                TColor.primaryColor2.withOpacity(0.3),
                                TColor.primaryColor1.withOpacity(0.3)
                              ]),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60.0,
                                ),
                                CircleAvatar(
                                  radius: 17.5,
                                  child: Image.asset("assets/img/user.png"),
                                ),
                                SizedBox(
                                  width: 7.5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("kan15hka"),
                                    Text(
                                      "Level X",
                                      style: TextStyle(
                                          fontSize: 11, color: TColor.gray),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  Iconsax.arrow_right_3,
                                  size: 20.0,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 20.0,
                              top: 10.0,
                              height: 75.0,
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    TColor.secondaryColor1.withOpacity(0.5),
                                    TColor.secondaryColor2.withOpacity(0.5)
                                  ]),
                                ),
                              )),
                          Positioned(
                            left: -50.0,
                            top: 0.0,
                            height: 90.0,
                            child: Image.asset(
                              creaturesList[index]["img"],
                              height: 100.0,
                            ),
                          ),
                        ],
                      );
                    }))),
          ],
        ),
      ),
    );
  }
}

class LeaderBoardLeadingCard extends StatelessWidget {
  const LeaderBoardLeadingCard({
    required this.height,
    super.key,
    required this.name,
    required this.winNum,
    required this.color,
  });
  final double height;
  final String name, winNum;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: TColor.primaryColor1,
          radius: 35.0,
          child: Image.asset("assets/img/user.png"),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "Level X",
          style: TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 75.0,
          height: height,
          decoration: BoxDecoration(
              color: TColor.secondaryColor2.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Center(
              child: Text(
            winNum,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          )),
        )
      ],
    );
  }
}
