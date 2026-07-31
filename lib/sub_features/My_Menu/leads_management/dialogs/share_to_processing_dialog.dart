import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';

class ShareToProcessingDialog extends StatefulWidget {
  final List<String> selectedLeadNames;

  const ShareToProcessingDialog({super.key, required this.selectedLeadNames});

  @override
  State<ShareToProcessingDialog> createState() =>
      _ShareToProcessingDialogState();
}

class _ShareToProcessingDialogState extends State<ShareToProcessingDialog> {
  bool _shareToProcessing = false;

  @override
  Widget build(BuildContext context) {
    final count = widget.selectedLeadNames.length;

    return Dialog(
      backgroundColor: AppColors.leadDialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
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
                    'Share To Processing',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
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
            SizedBox(height: 0.6.h),
            Text(
              'This option will remove sharing from operation.',
              style: TextStyle(fontSize: 16.sp, color: Colors.redAccent),
            ),
            SizedBox(height: 2.h),

            Text(
              '$count leads selected',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 1.5.h),

            CheckboxListTile(
              value: _shareToProcessing,
              onChanged: (val) =>
                  setState(() => _shareToProcessing = val ?? false),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.bottomNavBackground,
              title: Text(
                'Share Selected Leads to Processing',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 1.5.h),

            Text(
              'Not Share ($count):',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.onboardingTitle,
              ),
            ),
            SizedBox(height: 0.6.h),
            ...widget.selectedLeadNames.map(
              (name) => Padding(
                padding: EdgeInsets.only(bottom: 0.3.h),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.onboardingDescription,
                  ),
                ),
              ),
            ),

            SizedBox(height: 3.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.onboardingDescription),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: AppColors.onboardingDescription,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bottomNavBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Wire up to API / Bloc event.
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
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
