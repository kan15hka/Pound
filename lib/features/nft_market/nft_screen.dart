import 'dart:ui';

import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/like_button.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/common/widgets/card/nft_market_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NFTScreen extends StatelessWidget {
  const NFTScreen({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: image,
                child: Image.asset(image),
              ),
              Positioned(
                  top: 35.0,
                  right: 35.0,
                  height: 40.0,
                  width: 40.0,
                  child: LikeButton()),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  children: [
                    BlurContainer(
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: const Text(
                          'Digital NFT Art',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    "Monkenizer",
                    style: TextStyle(
                        color: TColor.white.withOpacity(0.7),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                Text(
                  'A monkey based NFT creted for trading fitness collectibles.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: TColor.gray,
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: media.width * 0.4,
                  child: UserCard(
                    isDark: true,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(
                          color: TColor.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "5.13ETH",
                      style: TextStyle(
                          color: TColor.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: SizedBox(
                      height: 40.0,
                      width: media.width * 0.7,
                      child: RoundButton(title: "Trade", onPressed: () {})),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  const BlurContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: child,
      ),
    );
  }
}
