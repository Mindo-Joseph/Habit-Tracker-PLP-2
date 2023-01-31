import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:habittracker/widgets/day_slip.dart';
import 'package:habittracker/widgets/habit_list.dart';
import 'package:habittracker/widgets/progress_bar.dart';
import 'package:habittracker/widgets/top_card.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopCard(),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 12.h,
          child: const DaySlide(),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.h),
                topRight: Radius.circular(3.h),
              ),
            ),
            child: Column(
              children: [
                const ProgressBar(),
                SizedBox(
                  height: 2.h,
                ),
                const Expanded(
                  child: HabitList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
