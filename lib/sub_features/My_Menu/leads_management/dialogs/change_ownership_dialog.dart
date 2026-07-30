import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../dropdown/custom_dropdown.dart';

class ChangeOwnershipDialog extends StatefulWidget {
  final int selectedLeadsCount;

  const ChangeOwnershipDialog({super.key, required this.selectedLeadsCount});

  @override
  State<ChangeOwnershipDialog> createState() => _ChangeOwnershipDialogState();
}

class _ChangeOwnershipDialogState extends State<ChangeOwnershipDialog> {
  String? _office = 'All Offices';
  String? _employee = 'All Staff';
  String? _country;
  String? _program;
  String? _category;

  bool _resetCreateDate = false;
  bool _resetStatus = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    'Change Ownership',
                    style: TextStyle(
                      fontSize: 15.sp,
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

            Text(
              'Sales Ownership',
              style: TextStyle(
                fontSize: 13.sp,
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
                    Text(
                      '${widget.selectedLeadsCount} leads selected',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    CustomDropdownField(
                      label: 'Filter Office',
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

                    CustomDropdownField(
                      label: 'Select Country',
                      value: _country,
                      items: const ['Pakistan', 'USA', 'UK', 'Canada'],
                      onChanged: (val) => setState(() => _country = val),
                    ),
                    SizedBox(height: 2.h),

                    CustomDropdownField(
                      label: 'Select Program',
                      value: _program,
                      items: const ['Ph.D. Program', 'Masters', 'Bachelors'],
                      onChanged: (val) => setState(() => _program = val),
                    ),
                    SizedBox(height: 2.h),

                    CustomDropdownField(
                      label: 'Select Category',
                      value: _category,
                      items: const ['Category 1', 'Category 2', 'Category 3'],
                      onChanged: (val) => setState(() => _category = val),
                    ),
                    SizedBox(height: 1.h),

                    CheckboxListTile(
                      value: _resetCreateDate,
                      onChanged: (val) =>
                          setState(() => _resetCreateDate = val ?? false),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.bottomNavBackground,
                      title: Text(
                        'Reset Create Date to Today',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    CheckboxListTile(
                      value: _resetStatus,
                      onChanged: (val) =>
                          setState(() => _resetStatus = val ?? false),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.bottomNavBackground,
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                          ),
                          children: const [
                            TextSpan(text: 'Reset Status to '),
                            TextSpan(
                              text: 'New',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h),

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
                      fontSize: 12.sp,
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
                    'Change Ownership',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
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
