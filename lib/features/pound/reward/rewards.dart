import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/card/nft_market_card.dart';
import 'package:fitness/features/nft_market/nft_screen.dart';
import 'package:fitness/features/pound/creature_page/creatures_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PageAppBar(title: "Target Reward"),
      backgroundColor: Colors.white,
      body: Container(
        color: TColor.primaryColor2.withOpacity(0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -math.pi / 20.0,
                    child: SizedBox(
                      height: media.width * 0.6,
                      width: media.width * 0.4,
                      child: CreatureCard(
                        fObj: {
                          "name": "HorseHulk",
                          "img": "assets/3d/img/horse.png",
                          "3d": "assets/3d/horse.glb",
                        },
                        media: media,
                        colorBool: true,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: math.pi / 20.0,
                    child: NftMarketCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  NFTScreen(image: "assets/nfts/1.png")),
                        );
                      },
                      media: media,
                      image: "assets/nfts/1.png",
                      price: "0.53ETH",
                      name: "Monkenizer",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Congrajulations!!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "You have won rewards for completing your fitness targets",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                      color: TColor.gray),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
