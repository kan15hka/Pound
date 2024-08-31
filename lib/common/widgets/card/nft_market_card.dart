import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NftMarketCard extends StatefulWidget {
  const NftMarketCard({
    super.key,
    required this.media,
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
  });

  final Size media;
  final String image, name, price;
  final VoidCallback? onTap;

  @override
  State<NftMarketCard> createState() => _NftMarketCardState();
}

class _NftMarketCardState extends State<NftMarketCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.media.width * 0.45,
        height: widget.media.width * 0.65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       blurRadius: 2,
          //       spreadRadius: 2)
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Hero(
                    tag: widget.image,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(widget.image)),
                  ),
                ),
                Positioned(
                    top: 10.0, right: 10.0, width: 35.0, child: LikeButton()),
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: UserCard(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "price",
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.price,
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          topLeft: Radius.circular(25.0)),
                      gradient: LinearGradient(colors: TColor.primaryG)),
                  child: Icon(Iconsax.trade),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    this.isDark = false,
  });
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isDark
              ? Colors.black.withOpacity(0.75)
              : Colors.white.withOpacity(0.75)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Image.asset("assets/img/user.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 5.0),
            child: Text(
              "tyler",
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
