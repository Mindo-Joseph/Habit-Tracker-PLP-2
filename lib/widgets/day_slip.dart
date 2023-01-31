import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class DaySlide extends StatelessWidget {
  const DaySlide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 17.w,
            margin: EdgeInsets.only(
              right: 2.h,
            ),
            padding: EdgeInsets.only(
              top: 2.h,
              bottom: 2.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.cardbg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: index == 0 ? AppColor.primary : AppColor.white,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'THU',
                  style: TextStyle(
                    color: AppColor.dark,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  '16',
                  style: TextStyle(
                    color: AppColor.dark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
