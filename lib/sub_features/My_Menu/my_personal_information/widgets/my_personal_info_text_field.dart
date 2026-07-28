import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';

class MyPersonalInfoTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isMultiline;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final String? hintText;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const MyPersonalInfoTextField({
    super.key,
    required this.label,
    this.controller,
    this.isMultiline = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.hintText,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onboardingDescription,
          ),
        ),
        SizedBox(height: 0.8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: isMultiline ? 3 : 1,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          style: TextStyle(fontSize: 16.sp, color: AppColors.onboardingTitle),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: AppColors.onboardingDescription.withOpacity(0.5),
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 5.w,
                    color: AppColors.bottomNavBackground,
                  )
                : null,
            filled: true,
            fillColor: AppColors.loginFieldFill,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 3.5.w,
              vertical: 1.6.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
