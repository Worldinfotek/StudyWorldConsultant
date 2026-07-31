import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/app_popups/app_popups.dart';
import '../../../../core/colors/app_colors.dart';
import '../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../dropdown/custom_dropdown.dart';

class AddLeadScreen extends StatefulWidget {
  final bool isEdit;

  const AddLeadScreen({super.key, this.isEdit = false});

  @override
  State<AddLeadScreen> createState() => _AddLeadScreenState();
}

class _AddLeadScreenState extends State<AddLeadScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers
  final _nameController = TextEditingController();
  final _cnicController = TextEditingController();
  final _presentAddressController = TextEditingController();
  final _mobileController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _englishScoreController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _workExperienceController = TextEditingController();
  final _followUpDateController = TextEditingController();
  final _followUpTimeController = TextEditingController();

  final _spouseNameController = TextEditingController();
  final _spouseAgeController = TextEditingController();
  final _spouseQualificationController = TextEditingController();
  final _spouseWorkExperienceController = TextEditingController();
  final _commentsController = TextEditingController();

  // Dropdown values
  String? _assignedTo;
  String? _assignedDsu;
  String? _country = 'USA';
  String? _program;
  String? _category;
  String? _clientStatus = 'New Leads';
  String? _source = 'Walk In';
  String? _intakeMonth;
  String? _intakeYear;
  String? _englishTest;

  bool _isInternational = false;
  bool _isMarried = false;

  @override
  void dispose() {
    _nameController.dispose();
    _cnicController.dispose();
    _presentAddressController.dispose();
    _mobileController.dispose();
    _whatsappController.dispose();
    _englishScoreController.dispose();
    _cityController.dispose();
    _ageController.dispose();
    _qualificationController.dispose();
    _workExperienceController.dispose();
    _followUpDateController.dispose();
    _followUpTimeController.dispose();
    _spouseNameController.dispose();
    _spouseAgeController.dispose();
    _spouseQualificationController.dispose();
    _spouseWorkExperienceController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  Future<void> _selectFollowUpDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      _followUpDateController.text =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  Future<void> _selectFollowUpTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      _followUpTimeController.text = picked.format(context);
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      // TODO: Wire this up to an API call / Bloc event later.
      AppPopups.success(
        context,
        message: widget.isEdit
            ? 'Lead updated successfully!'
            : 'Lead saved successfully!',
        onOkPressed: () => Navigator.of(context).pop(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: Text(
          widget.isEdit ? 'Edit Lead' : 'New Lead',
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
                CustomDropdownField(
                  label: 'Assigned To',
                  value: _assignedTo,
                  items: const ['Agent 1', 'Agent 2', 'Agent 3'],
                  onChanged: (val) => setState(() => _assignedTo = val),
                ),
                SizedBox(height: 2.h),
                CustomDropdownField(
                  label: 'Assigned DSU',
                  value: _assignedDsu,
                  items: const ['DSU 1', 'DSU 2'],
                  onChanged: (val) => setState(() => _assignedDsu = val),
                ),
                SizedBox(height: 2.h),

                MyPersonalInfoTextField(
                  label: 'Name',
                  controller: _nameController,
                  prefixIcon: Icons.person_outline,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'CNIC',
                  controller: _cnicController,
                  prefixIcon: Icons.badge_outlined,
                  hintText: 'CNIC',
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Present Address',
                  controller: _presentAddressController,
                  isMultiline: true,
                  prefixIcon: Icons.location_on_outlined,
                  hintText: 'Present Address',
                ),
                SizedBox(height: 2.h),

                MyPersonalInfoTextField(
                  label: 'Mobile Number',
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  hintText: 'Mobile Number',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mobile Number is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'WhatsApp Number',
                  controller: _whatsappController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.chat_outlined,
                  hintText: 'WhatsApp Number',
                ),
                SizedBox(height: 1.h),

                CheckboxListTile(
                  value: _isInternational,
                  onChanged: (val) =>
                      setState(() => _isInternational = val ?? false),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.bottomNavBackground,
                  title: const Text('International'),
                ),
                SizedBox(height: 1.h),

                CustomDropdownField(
                  label: 'Country',
                  value: _country,
                  items: const ['USA', 'UK', 'Canada', 'Pakistan', 'Australia'],
                  onChanged: (val) => setState(() => _country = val),
                ),
                SizedBox(height: 2.h),
                CustomDropdownField(
                  label: 'Program',
                  value: _program,
                  items: const ['Ph.D. Program', 'Masters', 'Bachelors'],
                  onChanged: (val) => setState(() => _program = val),
                ),
                SizedBox(height: 2.h),
                CustomDropdownField(
                  label: 'Category',
                  value: _category,
                  items: const ['Category 1', 'Category 2', 'Category 3'],
                  onChanged: (val) => setState(() => _category = val),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                CustomDropdownField(
                  label: 'Client Status',
                  value: _clientStatus,
                  items: const [
                    'New Leads',
                    'Contacted',
                    'Follow Up',
                    'Closed',
                  ],
                  onChanged: (val) => setState(() => _clientStatus = val),
                ),
                SizedBox(height: 2.h),
                CustomDropdownField(
                  label: 'Source',
                  value: _source,
                  items: const ['Walk In', 'Facebook', 'Website', 'Referral'],
                  onChanged: (val) => setState(() => _source = val),
                ),
                SizedBox(height: 2.h),

                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownField(
                        label: 'Intake Month',
                        value: _intakeMonth,
                        items: const [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec',
                        ],
                        onChanged: (val) => setState(() => _intakeMonth = val),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: CustomDropdownField(
                        label: 'Intake Year',
                        value: _intakeYear,
                        items: const ['2025', '2026', '2027'],
                        onChanged: (val) => setState(() => _intakeYear = val),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                CustomDropdownField(
                  label: 'Any English Test',
                  value: _englishTest,
                  items: const ['IELTS', 'TOEFL', 'PTE', 'Duolingo', 'None'],
                  onChanged: (val) => setState(() => _englishTest = val),
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'English Test Score',
                  controller: _englishScoreController,
                  prefixIcon: Icons.score_outlined,
                  hintText: 'Score',
                ),
                SizedBox(height: 2.h),

                MyPersonalInfoTextField(
                  label: 'City',
                  controller: _cityController,
                  prefixIcon: Icons.location_city_outlined,
                  hintText: 'City',
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Age',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.cake_outlined,
                  hintText: 'Age',
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Qualification',
                  controller: _qualificationController,
                  prefixIcon: Icons.school_outlined,
                  hintText: 'Qualification',
                ),
                SizedBox(height: 2.h),

                MyPersonalInfoTextField(
                  label: 'Follow Up Date',
                  controller: _followUpDateController,
                  prefixIcon: Icons.calendar_today_outlined,
                  hintText: 'Select Follow Up Date',
                  readOnly: true,
                  onTap: _selectFollowUpDate,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Follow Up Time',
                  controller: _followUpTimeController,
                  prefixIcon: Icons.access_time_outlined,
                  hintText: '--:-- --',
                  readOnly: true,
                  onTap: _selectFollowUpTime,
                ),
                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Work Experience',
                  controller: _workExperienceController,
                  prefixIcon: Icons.work_outline,
                  hintText: 'Work Experience',
                ),
                SizedBox(height: 1.h),

                CheckboxListTile(
                  value: _isMarried,
                  onChanged: (val) => setState(() => _isMarried = val ?? false),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.bottomNavBackground,
                  title: const Text('Marital status'),
                ),

                // ===== Spouse fields — only visible when Marital status is checked =====
                if (_isMarried) ...[
                  SizedBox(height: 1.h),
                  MyPersonalInfoTextField(
                    label: 'Spouse Name',
                    controller: _spouseNameController,
                    prefixIcon: Icons.person_outline,
                    hintText: 'Spouse Name',
                  ),
                  SizedBox(height: 2.h),
                  MyPersonalInfoTextField(
                    label: 'Spouse Age',
                    controller: _spouseAgeController,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.cake_outlined,
                    hintText: 'Spouse Age',
                  ),
                  SizedBox(height: 2.h),
                  MyPersonalInfoTextField(
                    label: 'Spouse Qualification',
                    controller: _spouseQualificationController,
                    prefixIcon: Icons.school_outlined,
                    hintText: 'Spouse Qualification',
                  ),
                  SizedBox(height: 2.h),
                  MyPersonalInfoTextField(
                    label: 'Spouse Work Experience',
                    controller: _spouseWorkExperienceController,
                    prefixIcon: Icons.work_outline,
                    hintText: 'Spouse Work Experience',
                  ),
                ],

                SizedBox(height: 2.h),
                MyPersonalInfoTextField(
                  label: 'Comments',
                  controller: _commentsController,
                  isMultiline: true,
                  prefixIcon: Icons.comment_outlined,
                  hintText: 'Comments',
                ),

                SizedBox(height: 4.h),

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
                          widget.isEdit ? 'Update' : 'Save',
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
                          side: BorderSide(
                            color: AppColors.onboardingDescription,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
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
