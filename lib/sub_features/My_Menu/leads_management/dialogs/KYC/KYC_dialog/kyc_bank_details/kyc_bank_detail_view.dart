import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../models/kyc_bank_detail_model.dart';

class KycBankDetailViewDialog extends StatelessWidget {
  final KycBankDetailModel record;

  const KycBankDetailViewDialog({super.key, required this.record});

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
                      Icons.account_balance_outlined,
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
                          record.bankName,
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
                          'Bank Detail',
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
                    // --- Account Title + Currency (grouped) ---
                    _sectionCard(
                      icon: Icons.badge_outlined,
                      title: 'Account Info',
                      child: Row(
                        children: [
                          Expanded(
                            child: _miniField(
                              'Account Title',
                              record.accountTitle,
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
                              'Currency',
                              record.accountCurrency,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Account Number & IBAN ---
                    _sectionCard(
                      icon: Icons.credit_card_outlined,
                      title: 'Account Numbers',
                      child: Column(
                        children: [
                          _rowPair(
                            'Account Number',
                            record.accountNumber,
                            'Swift Code',
                            record.swiftCode,
                          ),
                          SizedBox(height: 1.4.h),
                          _miniField('IBAN', record.iban),
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
                          _iconField(Icons.email_outlined, record.email),
                          if (record.website.isNotEmpty) ...[
                            SizedBox(height: 1.2.h),
                            _iconField(Icons.language_outlined, record.website),
                          ],
                          if (record.concernPerson.isNotEmpty) ...[
                            SizedBox(height: 1.2.h),
                            _iconField(
                              Icons.person_outline,
                              record.concernPerson,
                            ),
                          ],
                        ],
                      ),
                    ),

                    SizedBox(height: 1.8.h),

                    // --- Address ---
                    _sectionCard(
                      icon: Icons.location_on_outlined,
                      title: 'Bank Address',
                      child: Text(
                        record.bankAddress.isEmpty ? '-' : record.bankAddress,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onboardingTitle,
                          height: 1.4,
                        ),
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
