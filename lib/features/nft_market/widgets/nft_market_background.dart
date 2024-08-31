import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/features/nft_market/widgets/image_list_view.dart';
import 'package:flutter/material.dart';

class NftMarketBackground extends StatelessWidget {
  const NftMarketBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Colors.black,
          child: Column(
            children: const <Widget>[
              ImageListView(
                startIndex: 1,
                duration: 25,
              ),
              ImageListView(
                startIndex: 11,
                duration: 45,
              ),
              ImageListView(
                startIndex: 21,
                duration: 65,
              ),
              // ImageListView(
              //   startIndex: 1,
              //   duration: 25,
              // ),
              // ImageListView(
              //   startIndex: 11,
              //   duration: 45,
              // ),
              // ImageListView(
              //   startIndex: 21,
              //   duration: 65,
              // ),
              // ImageListView(
              //   startIndex: 31,
              //   duration: 30,
              // ),
            ],
          ),
        ),
        Positioned(
          bottom: -25.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                )),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: TColor.primaryColor1.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
            ),
          ),
        )
      ],
    );
  }
}
