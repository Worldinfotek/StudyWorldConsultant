import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final List<String> entries; // e.g. "Test lead (03001234567)"
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({
    super.key,
    required this.entries,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.leadDialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      insetPadding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 22.w,
              height: 22.w,
              child: Lottie.asset(
                'assets/popups/warning.lottie',
                repeat: false,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 2.5.h),

            Text(
              'Are you sure?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.onboardingTitle,
              ),
            ),
            SizedBox(height: 2.h),

            Text(
              'Delete the following entries:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.onboardingDescription,
              ),
            ),
            SizedBox(height: 0.5.h),
            ...entries.map(
              (entry) => Text(
                entry,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.onboardingDescription,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 3.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      side: BorderSide.none,
                      padding: EdgeInsets.symmetric(vertical: 1.6.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.onboardingTitle,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginButton,
                      padding: EdgeInsets.symmetric(vertical: 1.6.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
