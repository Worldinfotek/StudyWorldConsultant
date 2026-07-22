import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/colors/app_colors.dart';
import '../model/onboarding_model.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Image.asset(data.imagePath, fit: BoxFit.contain),
          ),
          SizedBox(height: 3.h),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.5.h),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
