import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/card/nft_market_card.dart';
import 'package:fitness/common/widgets/other/title_subtitle_cell.dart';
import 'package:fitness/features/nft_market/nft_screen.dart';
import 'package:fitness/features/pound/creature_page/creatures_page.dart';
import 'package:flutter/material.dart';

class TargetRewardsWidget extends StatelessWidget {
  const TargetRewardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: TColor.primaryColor2.withOpacity(0.3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rewards",
            style: TextStyle(
                color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: media.width * 0.55,
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
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "Unlock Creature",
                      subtitle: "You unlock the creature and boost your level",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "Unlock NFTs",
                      subtitle: "Earn NFTs while you reach the fitness goal",
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  NftMarketCard(
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
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
