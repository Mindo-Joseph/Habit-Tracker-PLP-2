import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.h),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color(0xFFCB94DD),
            Color(0xFFBB86DB),
            Color(0xFF9D70E4),
            Color(0xFF8157DA),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(0.7.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.white.withOpacity(0.4)),
                    color: AppColor.premium.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Go premium',
                    style: TextStyle(
                      color: AppColor.dark,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                    Text(
                      'John!',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'You have 3 activities today',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColor.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 40.w,
            child: const Image(
              image: AssetImage('assets/3d-desk-calendar.webp'),
            ),
          ),
        ],
      ),
    );
  }
}
