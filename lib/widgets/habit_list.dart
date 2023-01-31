import 'package:flutter/material.dart';
import 'package:habittracker/widgets/habit_card.dart';
import 'package:sizer/sizer.dart';

class HabitList extends StatefulWidget {
  const HabitList({super.key});

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(
        top: 0,
        left: 0,
        right: 0,
        bottom: 7.h,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const HabitCard();
      },
    );
  }
}
