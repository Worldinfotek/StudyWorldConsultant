import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppLoadingIndicator extends StatelessWidget {
  final String text;
  final String animationPath;

  const AppLoadingIndicator({
    super.key,
    required this.text,
    this.animationPath = 'assets/loading_animation/Loading-animation.lottie',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 65.w,
          height: 40.h,
          child: Lottie.asset(
            animationPath,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}