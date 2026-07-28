import 'package:OWILC/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/app_popups/app_popups.dart';
import '../../../../core/colors/app_colors.dart';
import '../widgets/my_personal_info_text_field.dart' show MyPersonalInfoTextField;

class MyPersonalInformationScreen extends StatefulWidget {
  const MyPersonalInformationScreen({super.key});


  @override
  State<MyPersonalInformationScreen> createState() =>
      _MyPersonalInformationScreenState();
}

class _MyPersonalInformationScreenState
    extends State<MyPersonalInformationScreen> {

  final _formKey = GlobalKey<FormState>();
  // Basic info
  final _fullNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _homeAddressController = TextEditingController();

  // Primary emergency contact
  final _primaryNameController = TextEditingController();
  final _primaryRelationController = TextEditingController();
  final _primaryPhonePrimaryController = TextEditingController();
  final _primaryPhoneAltController = TextEditingController();
  final _primaryAddressController = TextEditingController();

  // Secondary emergency contact
  final _secondaryNameController = TextEditingController();
  final _secondaryRelationController = TextEditingController();
  final _secondaryPhonePrimaryController = TextEditingController();
  final _secondaryPhoneAltController = TextEditingController();
  final _secondaryAddressController = TextEditingController();

  // Medical info
  final _bloodGroupController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _medicalConditionsController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _homeAddressController.dispose();
    _primaryNameController.dispose();
    _primaryRelationController.dispose();
    _primaryPhonePrimaryController.dispose();
    _primaryPhoneAltController.dispose();
    _primaryAddressController.dispose();
    _secondaryNameController.dispose();
    _secondaryRelationController.dispose();
    _secondaryPhonePrimaryController.dispose();
    _secondaryPhoneAltController.dispose();
    _secondaryAddressController.dispose();
    _bloodGroupController.dispose();
    _allergiesController.dispose();
    _medicalConditionsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      _dobController.text =
      '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';
    }
  }

  void _onSave() {
    // TODO: Wire this up to an API call / Bloc event later.
    if (_formKey.currentState!.validate()) {
      AppPopups.success(context, message: AppConstant.infoSavedMessage);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: Text(
          AppConstant.personalInfoTitle,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Basic Info =====
                MyPersonalInfoTextField(
                  label: AppConstant.fullNameLabel,
                  controller: _fullNameController,
                  prefixIcon: Icons.person_outline,
                  hintText: AppConstant.fullNameLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.dobLabel,
                  controller: _dobController,
                  keyboardType: TextInputType.datetime,
                  prefixIcon: Icons.calendar_today_outlined,
                  hintText: AppConstant.dobLabel,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.phoneNumberLabel,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  hintText: AppConstant.phoneNumberLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.emailAddressLabel,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  hintText: AppConstant.emailAddressLabel,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.homeAddressLabel,
                  controller: _homeAddressController,
                  isMultiline: true,
                  prefixIcon: Icons.home_outlined,
                  hintText: AppConstant.homeAddressLabel,
                ),

                SizedBox(height: 3.h),
                _SectionDivider(title: AppConstant.primaryEmergencySectionTitle),
                SizedBox(height: 2.h),

                // ===== Primary Emergency Contact =====
                MyPersonalInfoTextField(
                  label: AppConstant.primaryEmergencyNameLabel,
                  controller: _primaryNameController,
                  prefixIcon: Icons.person_outline,
                  hintText: AppConstant.primaryEmergencyNameLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.primaryEmergencyRelationLabel,
                  controller: _primaryRelationController,
                  prefixIcon: Icons.people_outline,
                  hintText: AppConstant.primaryEmergencyRelationLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.primaryEmergencyPhonePrimaryLabel,
                  controller: _primaryPhonePrimaryController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  hintText: AppConstant.primaryEmergencyPhonePrimaryLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.primaryEmergencyPhoneAltLabel,
                  controller: _primaryPhoneAltController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_android_outlined,
                  hintText: AppConstant.primaryEmergencyPhoneAltLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.primaryEmergencyAddressLabel,
                  controller: _primaryAddressController,
                  isMultiline: true,
                  prefixIcon: Icons.location_on_outlined,
                  hintText: AppConstant.primaryEmergencyAddressLabel,
                ),

                SizedBox(height: 3.h),
                _SectionDivider(title: AppConstant.secondaryEmergencySectionTitle),
                SizedBox(height: 2.h),

                // ===== Secondary Emergency Contact =====
                MyPersonalInfoTextField(
                  label: AppConstant.secondaryEmergencyNameLabel,
                  controller: _secondaryNameController,
                  prefixIcon: Icons.person_outline,
                  hintText: AppConstant.secondaryEmergencyNameLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.secondaryEmergencyRelationLabel,
                  controller: _secondaryRelationController,
                  prefixIcon: Icons.people_outline,
                  hintText: AppConstant.secondaryEmergencyRelationLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.secondaryEmergencyPhonePrimaryLabel,
                  controller: _secondaryPhonePrimaryController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  hintText: AppConstant.secondaryEmergencyPhonePrimaryLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.secondaryEmergencyPhoneAltLabel,
                  controller: _secondaryPhoneAltController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_android_outlined,
                  hintText: AppConstant.secondaryEmergencyPhoneAltLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.secondaryEmergencyAddressLabel,
                  controller: _secondaryAddressController,
                  isMultiline: true,
                  prefixIcon: Icons.location_on_outlined,
                  hintText: AppConstant.secondaryEmergencyAddressLabel,
                ),

                SizedBox(height: 3.h),
                _SectionDivider(title: AppConstant.medicalInfoSectionTitle),
                SizedBox(height: 2.h),

                // ===== Medical Info =====
                MyPersonalInfoTextField(
                  label: AppConstant.bloodGroupLabel,
                  controller: _bloodGroupController,
                  prefixIcon: Icons.bloodtype_outlined,
                  hintText: AppConstant.bloodGroupLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.allergiesLabel,
                  controller: _allergiesController,
                  prefixIcon: Icons.warning_amber_outlined,
                  hintText: AppConstant.allergiesLabel,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: AppConstant.medicalConditionsLabel,
                  controller: _medicalConditionsController,
                  prefixIcon: Icons.medical_information_outlined,
                  hintText: AppConstant.medicalConditionsLabel,
                ),

                SizedBox(height: 4.h),

                // ===== Save / Cancel =====
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bottomNavBackground,
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _onSave,
                        child: Text(
                          AppConstant.saveText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.onboardingDescription),
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          AppConstant.cancelText,
                          style: TextStyle(
                            color: AppColors.onboardingDescription,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  final String title;

  const _SectionDivider({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.onboardingTitle,
          ),
        ),
        SizedBox(height: 1.h),
        Divider(color: AppColors.onboardingDescription.withOpacity(0.2)),
      ],
    );
  }
}