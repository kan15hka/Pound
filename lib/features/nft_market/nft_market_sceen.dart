import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/card/nft_market_card.dart';
import 'package:fitness/common/widgets/other/shader_mask_text.dart';
import 'package:fitness/features/nft_market/nft_screen.dart';
import 'package:fitness/features/nft_market/widgets/image_list_view.dart';
import 'package:fitness/features/nft_market/widgets/nft_market_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NFTMarketView extends StatelessWidget {
  const NFTMarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.primaryColor1.withOpacity(0.15),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Nft Market IMage List Background
            NftMarketBackground(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Shadre mask text
                Center(
                  child: ShaderMaskText(
                    text: "Pound NFTs",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "My NFTs",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  height: media.height * 0.325,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: NftMarketCard(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NFTScreen(
                                        image: "assets/nfts/${index + 1}.png")),
                              );
                            },
                            media: media,
                            image: "assets/nfts/${index + 1}.png",
                            price: "0.53ETH",
                            name: "Monkenizer",
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    "NFTs Market",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: media.height * 0.325,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: NftMarketCard(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NFTScreen(
                                        image:
                                            "assets/nfts/${index + 21}.png")),
                              );
                            },
                            media: media,
                            image: "assets/nfts/${index + 21}.png",
                            price: "0.53ETH",
                            name: "Monkenizer",
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
