import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/features/home/home_view.dart';
import 'package:fitness/features/nft_market/nft_market_sceen.dart';
import 'package:fitness/features/pound/pound_view.dart';
import 'package:fitness/features/home/blank_view.dart';
import 'package:fitness/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentIndex = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  List<Widget> tabs = [
    HomeView(),
    PoundView(),
    NFTMarketView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: tabs[currentIndex]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: TColor.primaryColor2.withOpacity(0.25),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
        child: GNav(
            onTabChange: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            tabBorderRadius: 15,
            curve: Curves.linear, // tab animation curves
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: TColor.white, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: TColor.secondaryColor1.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
            tabBackgroundGradient: LinearGradient(colors: TColor.primaryG),
            tabs: [
              GButton(
                icon: Iconsax.home,
                text: 'Home',
              ),
              GButton(
                icon: Iconsax.health,
                text: 'Pound',
              ),
              GButton(
                icon: Iconsax.shop,
                text: 'Market',
              ),
              GButton(
                icon: Iconsax.user,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
