import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';

class LeadsFilterBottomSheet extends StatelessWidget {
  const LeadsFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: 0.5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Filter Leads',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onboardingTitle,
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    _dateField(context, 'Start Date'),
                    SizedBox(height: 2.h),
                    _dateField(context, 'End Date'),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Employee', [
                      'developer',
                      'sales-1',
                      'sales-2',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Lead Status', [
                      'New',
                      'Contacted',
                      'Follow Up',
                      'Closed',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Country', [
                      'Pakistan',
                      'UK',
                      'Canada',
                      'USA',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Program', [
                      'Ph.D. Program',
                      'Masters',
                      'Bachelors',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Category', [
                      'Category 1',
                      'Category 2',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Lead Source', [
                      'Facebook',
                      'Website',
                      'Referral',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Department', [
                      'Sales',
                      'Processing',
                      'Operations',
                    ]),
                    SizedBox(height: 2.h),
                    _dropdownField('Select Assigned', [
                      'Unassigned',
                      'Team A',
                      'Team B',
                    ]),
                    SizedBox(height: 1.h),
                    CheckboxListTile(
                      value: false,
                      onChanged: (_) {},
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.bottomNavBackground,
                      title: const Text('Refer To DSU'),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (_) {},
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.bottomNavBackground,
                      title: const Text('Shared With Manager'),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: reset filters
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 1.6.h),
                        side: BorderSide(
                          color: AppColors.onboardingDescription,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: apply filter (dispatch LeadsFilterApplied)
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bottomNavBackground,
                        padding: EdgeInsets.symmetric(vertical: 1.6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dateField(BuildContext context, String label) {
    return TextField(
      readOnly: true,
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
      },
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        filled: true,
        fillColor: AppColors.loginFieldFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdownField(String label, List<String> options) {
    return DropdownButtonFormField<String>(
      items: options
          .map(
            (e) =>
            DropdownMenuItem(
              value: e,
              child: Text(e, style: const TextStyle(fontSize: 13)),
            ),
      )
          .toList(),
      onChanged: (_) {},
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.loginFieldFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
