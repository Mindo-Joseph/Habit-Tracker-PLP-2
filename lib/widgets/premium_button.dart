import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 29.w,
      padding: EdgeInsets.only(
        left: 1.h,
        right: 1.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.premium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Iconsax.star,
            color: AppColor.white,
          ),
          Text(
            'Premium',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
