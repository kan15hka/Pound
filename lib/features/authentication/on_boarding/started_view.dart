import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:fitness/features/authentication/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              !isChangeColor
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)
                            .createShader(Rect.fromLTRB(
                                0, 0, bounds.width, bounds.height));
                      },
                      child: Text(
                        "Pound",
                        style: TextStyle(
                            color: TColor.white.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 40),
                      ),
                    )
                  : Text(
                      "Pound",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
              Text(
                "Move to Earn",
                style: TextStyle(
                  color: isChangeColor ? Colors.grey[200] : Colors.grey,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25.0),
                child: RoundButton(
                  title: "Get Started",
                  type: isChangeColor
                      ? RoundButtonType.textGradient
                      : RoundButtonType.bgGradient,
                  onPressed: () {
                    if (isChangeColor) {
                      //GO Next Screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()));
                    } else {
                      //Change Color
                      setState(() {
                        isChangeColor = true;
                      });
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
