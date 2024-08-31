import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/other/title_subtitle_cell.dart';
import 'package:fitness/features/pound/creature_page/creatures_page.dart';
import 'package:fitness/features/profile/widgets/height_weight_age.dart';
import 'package:fitness/features/profile/widgets/image_name_widget.dart';
import 'package:fitness/features/profile/widgets/profile_settings.dart';
import 'package:fitness/features/profile/widgets/wearable_band.dart';
import 'package:flutter/material.dart';
import '../../common/constants/color_constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PageAppBar(
        title: "Profile",
        isBackButton: false,
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Image and Username
              ImageNameWidget(
                img: "assets/img/user.png",
                username: "kan15hka",
                level: "Level X",
              ),

              const SizedBox(
                height: 15,
              ),

              //Height Weight and Age Card
              HeightWeightAgeCard(
                height: 180,
                weight: 65,
                age: 22,
              ),

              const SizedBox(
                height: 15,
              ),
              WearableBandWidget(media: media),
              const SizedBox(
                height: 15,
              ),

              CreatureAvatar(media: media),
              ProfileSettings()
            ],
          ),
        ),
      ),
    );
  }
}

class CreatureAvatar extends StatelessWidget {
  const CreatureAvatar({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Creature Avatar",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TitleSubtitleCell(
                title: "Unlock Creature",
                subtitle: "You unlock the creature and boost your level",
              ),
            ],
          ),
        ),
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
      ],
    );
  }
}
