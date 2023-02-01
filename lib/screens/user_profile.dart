import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:habittracker/widgets/button.dart';
import 'package:sizer/sizer.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    return ListView(
      children: [
        Center(
          child: Container(
            height: 19.h,
            width: 19.h,
            padding: EdgeInsets.all(0.4.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.dark),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: AssetImage('assets/picture.jpeg'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        // Text(
        //   'Personal Details:',
        //   style: TextStyle(
        //     fontSize: 17.sp,
        //     color: AppColor.dark,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(
              color: AppColor.border,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 10.h,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: firstNameController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: const InputDecoration(
                          labelText: 'First name',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 10.h,
                      child: TextFormField(
                        controller: lastNameController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: const InputDecoration(
                          labelText: 'Last name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
                child: TextFormField(
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        LargeButton(color: AppColor.primary, text: "Save")
      ],
    );
  }
}
