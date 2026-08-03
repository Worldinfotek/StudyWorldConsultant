import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../../../dropdown/custom_dropdown.dart';
import 'bloc/kyc_personal_detail/kyc_personal_detail_bloc.dart';

class KycPersonalDetailsDialog extends StatefulWidget {
  const KycPersonalDetailsDialog({super.key});

  @override
  State<KycPersonalDetailsDialog> createState() =>
      _KycPersonalDetailsDialogState();
}

class _KycPersonalDetailsDialogState extends State<KycPersonalDetailsDialog> {
  final _occupationController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _landlineController = TextEditingController();
  final _religionController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _bandController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _medicalConditionController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _currentMedicationController = TextEditingController();
  final _netWorthController = TextEditingController();
  final _availableFundsController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _occupationController.dispose();
    _motherNameController.dispose();
    _landlineController.dispose();
    _religionController.dispose();
    _nationalityController.dispose();
    _bandController.dispose();
    _bloodTypeController.dispose();
    _medicalConditionController.dispose();
    _allergiesController.dispose();
    _currentMedicationController.dispose();
    _netWorthController.dispose();
    _availableFundsController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dobController.text =
          '${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}T00:00:00';
    }
  }

  void _onSave() {
    // TODO: Wire up to API / Bloc event.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KycPersonalDetailBloc(),
      child: Dialog(
        backgroundColor: AppColors.splashBackground,
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
                      'Personal Information',
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

              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyPersonalInfoTextField(
                        label: 'Occupation',
                        controller: _occupationController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Mother Name',
                        controller: _motherNameController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'LandLine No.',
                        controller: _landlineController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Religion',
                        controller: _religionController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Nationality',
                        controller: _nationalityController,
                      ),
                      SizedBox(height: 2.h),
                      BlocBuilder<
                        KycPersonalDetailBloc,
                        KycPersonalDetailState
                      >(
                        builder: (context, state) {
                          return CustomDropdownField(
                            label: 'English Proficiency',
                            value: state.englishProficiency,
                            items: const [
                              'IELTS',
                              'TOEFL',
                              'PTE',
                              'Duolingo',
                              'None',
                            ],
                            onChanged: (val) {
                              if (val != null) {
                                context.read<KycPersonalDetailBloc>().add(
                                  EnglishProficiencyChanged(val),
                                );
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Band',
                        controller: _bandController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Blood Type',
                        controller: _bloodTypeController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Medical Condition',
                        controller: _medicalConditionController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Allergies(If Any)',
                        controller: _allergiesController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Current Medication(If Any)',
                        controller: _currentMedicationController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'NetWorth',
                        controller: _netWorthController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Available Funds',
                        controller: _availableFundsController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Date of Birth',
                        controller: _dobController,
                        prefixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: _selectDob,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.loginButton,
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 1.6.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _onSave,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
