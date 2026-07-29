import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../model/lead_model.dart';

class LeadListTile extends StatelessWidget {
  final LeadModel lead;
  final bool isSelected;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onDelete;

  const LeadListTile({
    super.key,
    required this.lead,
    required this.isSelected,
    required this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.8.h),
      decoration: BoxDecoration(
        color: AppColors.popupBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.bottomNavBackground
              : AppColors.bottomNavBackground.withOpacity(0.1),
          width: isSelected ? 1.4 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.popupShadow,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isSelected,
            activeColor: AppColors.bottomNavBackground,
            onChanged: onCheckboxChanged,
          ),

          // Lead info
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lead.name,
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onboardingTitle,
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  _infoRow(Icons.calendar_today_outlined, lead.date),
                  SizedBox(height: 0.5.h),
                  _infoRow(Icons.phone_outlined, lead.contactNumber),
                  SizedBox(height: 0.5.h),
                  _infoRow(Icons.public_outlined, lead.country),
                  SizedBox(height: 0.5.h),
                  _infoRow(Icons.school_outlined, lead.programCategory),
                  SizedBox(height: 0.5.h),
                  _infoRow(Icons.location_city_outlined, lead.city),
                ],
              ),
            ),
          ),

          // Right side: status + delete
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _StatusBadge(status: lead.leadStatus),
                SizedBox(height: 1.5.h),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: Colors.redAccent,
                  ),
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.onboardingDescription),
        SizedBox(width: 1.5.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.onboardingDescription,
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        color: AppColors.bottomNavBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.bottomNavBackground,
        ),
      ),
    );
  }
}
