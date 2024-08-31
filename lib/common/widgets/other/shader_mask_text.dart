import 'package:fitness/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ShaderMaskText extends StatelessWidget {
  const ShaderMaskText({
    super.key,
    this.fontSize = 18,
    required this.text,
  });
  final double fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
                colors: TColor.primaryG,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)
            .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: TextStyle(
            color: TColor.white.withOpacity(0.7),
            fontWeight: FontWeight.w700,
            fontSize: fontSize),
      ),
    );
  }
}
