import 'package:flutter/material.dart';

import '../../../common/constants/color_constants.dart';

class AuthWelcomeWidget extends StatelessWidget {
  const AuthWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Image.asset(
          "assets/img/logo.png",
          height: media.width * 0.4,
          width: media.width * 0.4,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Welcome Back",
          style: TextStyle(
              color: TColor.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          "Step into Pound: Your Journey to Earning Begins Here!",
          style: TextStyle(color: TColor.gray, fontSize: 14),
        ),
        SizedBox(
          height: media.width * 0.05,
        ),
      ],
    );
  }
}
