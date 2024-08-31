import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(0.75)),
        child: Center(
            child: isLiked
                ? Icon(
                    Iconsax.heart5,
                    color: Colors.red,
                  )
                : Icon(
                    Iconsax.heart,
                  )),
      ),
    );
  }
}
