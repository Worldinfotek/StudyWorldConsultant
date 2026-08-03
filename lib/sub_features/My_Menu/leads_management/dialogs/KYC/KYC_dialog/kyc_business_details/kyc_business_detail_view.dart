import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../models/kyc_business_detail_model.dart';

class KycBusinessDetailViewDialog extends StatelessWidget {
  final KycBusinessDetailModel record;

  const KycBusinessDetailViewDialog({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
      backgroundColor: AppColors.popupBackground,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ===== Header (Light Maroon ~30%) =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
              decoration: BoxDecoration(
                color: AppColors.bottomNavBackground.withOpacity(0.10),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.bottomNavBackground.withOpacity(0.15),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.8.w),
                    decoration: BoxDecoration(
                      color: AppColors.bottomNavBackground.withOpacity(0.15),
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
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.onboardingTitle,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 0.4.h),
                        Text(
                          'Business Detail',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                            color: AppColors.bottomNavBackground.withOpacity(
                              0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                      color: AppColors.onboardingDescription,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            // ===== Body =====
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Legal Status + Business Type (grouped) ---
                    _sectionCard(
                      icon: Icons.gavel_outlined,
                      title: 'Legal Info',
                      child: Row(
                        children: [
                          Expanded(
                            child: _miniField(
                              'Legal Status',
                              record.companyLegalStatus,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 5.h,
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            color: AppColors.onboardingDescription.withOpacity(
                              0.15,
                            ),
                          ),
                          Expanded(
                            child: _miniField(
                              'Business Type',
                              record.businessType,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Ownership (elegant circular badge) ---
                    _sectionCard(
                      icon: Icons.pie_chart_outline,
                      title: 'Ownership',
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 14.w,
                                height: 14.w,
                                child: CircularProgressIndicator(
                                  value: (_ownershipValue.clamp(0, 100)) / 100,
                                  strokeWidth: 5,
                                  backgroundColor: AppColors.bottomNavBackground
                                      .withOpacity(0.12),
                                  valueColor: AlwaysStoppedAnimation(
                                    AppColors.bottomNavBackground,
                                  ),
                                ),
                              ),
                              Text(
                                '${record.ownershipPercentage}%',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.onboardingTitle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              'Ownership stake held in the company',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.onboardingDescription,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Business Details ---
                    _sectionCard(
                      icon: Icons.description_outlined,
                      title: 'Business Details',
                      child: Column(
                        children: [
                          _rowPair(
                            'NTN',
                            record.ntn,
                            'Issue Date',
                            record.issueDate,
                          ),
                          SizedBox(height: 1.4.h),
                          _rowPair(
                            'LOB',
                            record.lob,
                            'Nature of Business',
                            record.natureOfBusiness,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Contact ---
                    _sectionCard(
                      icon: Icons.contact_mail_outlined,
                      title: 'Contact',
                      child: Column(
                        children: [
                          _iconField(Icons.phone_outlined, record.mobile),
                          SizedBox(height: 1.2.h),
                          _iconField(Icons.email_outlined, record.companyEmail),
                          if (record.website.isNotEmpty) ...[
                            SizedBox(height: 1.2.h),
                            _iconField(Icons.language_outlined, record.website),
                          ],
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Address ---
                    _sectionCard(
                      icon: Icons.location_on_outlined,
                      title: 'Address',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            record.officeAddress.isEmpty
                                ? '-'
                                : record.officeAddress,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onboardingTitle,
                              height: 1.4,
                            ),
                          ),
                          if (record.poBox.isNotEmpty) ...[
                            SizedBox(height: 1.h),
                            Text(
                              'P.O Box: ${record.poBox}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.onboardingDescription,
                              ),
                            ),
                          ],
                        ],
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

  // ===== Reusable helpers =====

  double get _ownershipValue {
    return double.tryParse(record.ownershipPercentage) ?? 0;
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(3.2.w),
      decoration: BoxDecoration(
        color: AppColors.onboardingDescription.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.onboardingDescription.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: AppColors.bottomNavBackground),
              SizedBox(width: 1.5.w),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                  color: AppColors.bottomNavBackground,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.4.h),
          child,
        ],
      ),
    );
  }

  Widget _miniField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: AppColors.onboardingDescription.withOpacity(0.6),
          ),
        ),
        SizedBox(height: 0.4.h),
        Text(
          value.isEmpty ? '-' : value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.onboardingTitle,
          ),
        ),
      ],
    );
  }

  Widget _rowPair(String label1, String value1, String label2, String value2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _miniField(label1, value1)),
        SizedBox(width: 3.w),
        Expanded(child: _miniField(label2, value2)),
      ],
    );
  }

  Widget _iconField(IconData icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: AppColors.onboardingDescription.withOpacity(0.6),
        ),
        SizedBox(width: 2.5.w),
        Expanded(
          child: Text(
            value.isEmpty ? '-' : value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onboardingTitle,
            ),
          ),
        ),
      ],
    );
  }
}
