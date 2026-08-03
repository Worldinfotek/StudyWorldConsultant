import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../../core/colors/app_colors.dart';
import '../../kyc_business_details/kyc_business_detail_view.dart';
import '../../models/kyc_business_detail_model.dart';

class KycBusinessDetailCard extends StatelessWidget {
  final KycBusinessDetailModel record;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const KycBusinessDetailCard({
    super.key,
    required this.record,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => KycBusinessDetailViewDialog(record: record),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.8.h),
        padding: EdgeInsets.all(3.5.w),
        decoration: BoxDecoration(
          color: AppColors.popupBackground,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.popupShadow,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: AppColors.bottomNavBackground.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.business_outlined,
                color: AppColors.bottomNavBackground,
                size: 22,
              ),
            ),
            SizedBox(width: 3.5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.companyName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onboardingTitle,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  Text(
                    record.businessType,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                  SizedBox(height: 0.2.h),
                  Text(
                    record.mobile,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: AppColors.onboardingDescription,
                size: 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 17,
                        color: AppColors.onboardingDescription,
                      ),
                      SizedBox(width: 2.5.w),
                      const Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete_outline,
                        size: 17,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'edit') onEdit();
                if (value == 'delete') onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
