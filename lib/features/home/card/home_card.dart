import 'package:OWILC/core/app_popups/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/colors/app_colors.dart';
import '../model/home_model.dart';

class HomeCard extends StatelessWidget {
  final HomeCardModel data;
  final VoidCallback? onTap;

  const HomeCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap:
          onTap ??
          () {
              AppPopups.warning(context, message: 'In Construction');
          },
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: AppColors.popupBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.bottomNavBackground.withOpacity(0.12),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.popupShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Top-right small accent icon
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(1.5.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bottomNavBackground.withOpacity(0.1),
                ),
                child: Icon(
                  data.icon,
                  size: 5.w,
                  color: AppColors.bottomNavBackground,
                ),
              ),
            ),

            // Center content
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onboardingTitle,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.onboardingDescription,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
