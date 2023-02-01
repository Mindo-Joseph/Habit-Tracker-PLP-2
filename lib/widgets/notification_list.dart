import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 2.h,
            ),
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 2.h,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: AppColor.iconDefault,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Habit Tracker PLP 2',
                      style: TextStyle(
                        color: AppColor.dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const Text(
                        'This is an example of a notification message...'),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const Text('2 hours ago'),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
