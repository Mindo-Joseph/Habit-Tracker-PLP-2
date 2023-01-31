import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 5.h,
      padding: EdgeInsets.all(0.5.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.dark,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: const Image(
          image: AssetImage("assets/picture.jpeg"),
        ),
      ),
    );
  }
}
