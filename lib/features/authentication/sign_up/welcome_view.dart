import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/navigation.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/color_constants.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/welcome.png",
              width: media.width * 0.75,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Text(
              "Welcome, User Name",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "You are all set now, let’s reach your\ngoals together with us",
              textAlign: TextAlign.center,
              style: TextStyle(color: TColor.gray, fontSize: 12),
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            RoundButton(
                title: "Go To Home",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationView()),
                      (Route route) => false);
                }),
          ],
        ),
      ),
    );
  }
}
