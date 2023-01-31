import 'package:flutter/material.dart';
import 'package:habittracker/screens/home.dart';
import 'package:habittracker/screens/notifications.dart';
import 'package:habittracker/screens/stats.dart';
import 'package:habittracker/screens/user_profile.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  int _currentScreen = 0;
  List screens = const [
    Home(),
    Stats(),
    Notifications(),
    User(),
  ];

  void changeScreen(int num) {
    setState(() {
      _currentScreen = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      key: _scaffoldState,
      backgroundColor: AppColor.background,
      body: Container(
        padding: EdgeInsets.only(
          left: 2.h,
          right: 2.h,
          top: 6.h,
        ),
        child: screens[_currentScreen],
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColor.fb,
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 6.h,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 3.w,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(
              left: 2.h,
              right: 2.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        changeScreen(0);
                      },
                      child: Icon(
                        Iconsax.home5,
                        color: _currentScreen == 0
                            ? AppColor.primary
                            : AppColor.iconDefault,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        changeScreen(1);
                      },
                      child: Icon(
                        Iconsax.activity5,
                        color: _currentScreen == 1
                            ? AppColor.primary
                            : AppColor.iconDefault,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        changeScreen(2);
                      },
                      child: Icon(
                        Iconsax.notification5,
                        color: _currentScreen == 2
                            ? AppColor.primary
                            : AppColor.iconDefault,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        changeScreen(3);
                      },
                      child: Icon(
                        Icons.person,
                        color: _currentScreen == 3
                            ? AppColor.primary
                            : AppColor.iconDefault,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
