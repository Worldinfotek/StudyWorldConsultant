import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/colors/app_colors.dart';

class KycFormDialog extends StatelessWidget {
  const KycFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.leadDialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Text(
                    'KYC Form',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onboardingTitle,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _kycButton(context, 'Personal Details', () {
                      // TODO: Navigate to Personal Details KYC screen
                    }),
                    _kycButton(context, 'Business Details', () {
                      // TODO: Navigate to Business Details KYC screen
                    }),
                    _kycButton(context, 'Bank Details', () {
                      // TODO: Navigate to Bank Details KYC screen
                    }),
                    _kycButton(context, 'Travel History Details', () {
                      // TODO: Navigate to Travel History Details KYC screen
                    }),
                    _kycButton(context, 'Professional Employee Details', () {
                      // TODO: Navigate to Professional Employee Details KYC screen
                    }),
                    _kycButton(context, 'Latest Education', () {
                      // TODO: Navigate to Latest Education KYC screen
                    }),
                    _kycButton(context, 'Manage Family', () {
                      // TODO: Navigate to Manage Family KYC screen
                    }),
                    _kycButton(context, 'Emergency Contact Details', () {
                      // TODO: Navigate to Emergency Contact Details KYC screen
                    }),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h),

            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 35.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 1.6.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Wire up Print KYC action
                  },
                  child: Text(
                    'Print Kyc',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kycButton(BuildContext context, String label, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bottomNavBackground,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onTap,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
