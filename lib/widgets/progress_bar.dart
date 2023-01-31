import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You're almost done for today, go ahead!",
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColor.text,
              ),
            ),
            Text(
              "80%",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.text,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        LinearPercentIndicator(
          lineHeight: 1.5.h,
          percent: .8,
          animation: true,
          barRadius: const Radius.circular(10),
          backgroundColor: AppColor.background,
          progressColor: AppColor.progresBar,
        )
      ],
    );
  }
}
