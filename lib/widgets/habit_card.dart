import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primary,
              AppColor.premium,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.fitness_center,
                size: 80.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Workout",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
