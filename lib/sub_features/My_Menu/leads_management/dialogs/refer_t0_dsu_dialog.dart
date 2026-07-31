import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../dropdown/custom_dropdown.dart';

class AssignToDsuDialog extends StatefulWidget {
  final String assignedTo;

  const AssignToDsuDialog({super.key, this.assignedTo = 'None'});

  @override
  State<AssignToDsuDialog> createState() => _AssignToDsuDialogState();
}

class _AssignToDsuDialogState extends State<AssignToDsuDialog> {
  String? _office = 'All Offices';
  String? _employee = 'All Staff';

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
                    'Assign To DSU',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
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

            Text(
              'Assign',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.onboardingTitle,
              ),
            ),
            SizedBox(height: 1.5.h),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdownField(
                      label: 'Filter employees by office',
                      value: _office,
                      items: const ['All Offices', 'Office 1', 'Office 2'],
                      onChanged: (val) => setState(() => _office = val),
                    ),
                    SizedBox(height: 2.h),

                    CustomDropdownField(
                      label: 'Select Employee',
                      value: _employee,
                      items: const ['All Staff', 'Agent 1', 'Agent 2'],
                      onChanged: (val) => setState(() => _employee = val),
                    ),
                    SizedBox(height: 2.h),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.onboardingDescription,
                        ),
                        children: [
                          const TextSpan(text: 'Already assigned to '),
                          TextSpan(
                            text: widget.assignedTo,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    'Assign',
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
