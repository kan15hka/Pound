import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/features/home/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserNameHeader extends StatelessWidget {
  const UserNameHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome Back,",
              style: TextStyle(color: TColor.gray, fontSize: 12),
            ),
            Text(
              "User Name",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
            icon: Badge(
                backgroundColor: Colors.red,
                smallSize: 10,
                child: Icon(Iconsax.notification_bing)))
      ],
    );
  }
}
