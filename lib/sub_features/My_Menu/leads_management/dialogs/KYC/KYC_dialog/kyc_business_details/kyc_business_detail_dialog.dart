import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../../../../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../../../../dropdown/custom_dropdown.dart';
import '../models/kyc_business_detail_model.dart';

class KycBusinessDetailsFormDialog extends StatefulWidget {
  final KycBusinessDetailModel? existingRecord;
  final void Function(KycBusinessDetailModel record) onSave;

  const KycBusinessDetailsFormDialog({
    super.key,
    this.existingRecord,
    required this.onSave,
  });

  @override
  State<KycBusinessDetailsFormDialog> createState() =>
      _KycBusinessDetailsFormDialogState();
}

class _KycBusinessDetailsFormDialogState
    extends State<KycBusinessDetailsFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final _companyNameController = TextEditingController(
    text: widget.existingRecord?.companyName,
  );
  late final _companyLegalStatusController = TextEditingController(
    text: widget.existingRecord?.companyLegalStatus,
  );
  late final _ownershipController = TextEditingController(
    text: widget.existingRecord?.ownershipPercentage,
  );
  late final _ntnController = TextEditingController(
    text: widget.existingRecord?.ntn,
  );
  late final _issueDateController = TextEditingController(
    text: widget.existingRecord?.issueDate ?? '01/01/0001',
  );
  late final _lobController = TextEditingController(
    text: widget.existingRecord?.lob,
  );
  late final _mobileController = TextEditingController(
    text: widget.existingRecord?.mobile,
  );
  late final _natureOfBusinessController = TextEditingController(
    text: widget.existingRecord?.natureOfBusiness,
  );
  late final _officeAddressController = TextEditingController(
    text: widget.existingRecord?.officeAddress,
  );
  late final _poBoxController = TextEditingController(
    text: widget.existingRecord?.poBox,
  );
  late final _companyEmailController = TextEditingController(
    text: widget.existingRecord?.companyEmail,
  );
  late final _websiteController = TextEditingController(
    text: widget.existingRecord?.website,
  );

  late String? _businessType =
      widget.existingRecord?.businessType ?? 'Sole Proprietorship';

  bool get _isEdit => widget.existingRecord != null;

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyLegalStatusController.dispose();
    _ownershipController.dispose();
    _ntnController.dispose();
    _issueDateController.dispose();
    _lobController.dispose();
    _mobileController.dispose();
    _natureOfBusinessController.dispose();
    _officeAddressController.dispose();
    _poBoxController.dispose();
    _companyEmailController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _selectIssueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      _issueDateController.text =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        KycBusinessDetailModel(
          companyName: _companyNameController.text,
          companyLegalStatus: _companyLegalStatusController.text,
          businessType: _businessType ?? 'SoleProprietorship',
          ownershipPercentage: _ownershipController.text,
          ntn: _ntnController.text,
          issueDate: _issueDateController.text,
          lob: _lobController.text,
          mobile: _mobileController.text,
          natureOfBusiness: _natureOfBusinessController.text,
          officeAddress: _officeAddressController.text,
          poBox: _poBoxController.text,
          companyEmail: _companyEmailController.text,
          website: _websiteController.text,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.splashBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _isEdit
                          ? 'Edit Business Details'
                          : 'New Business Details',
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
                        label: 'Company Name *',
                        controller: _companyNameController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Company Legal Status *',
                        controller: _companyLegalStatusController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      CustomDropdownField(
                        label: 'BusinessType *',
                        value: _businessType,
                        items: const [
                          'Sole Proprietorship',
                          'Partnership',
                          'Private Limited',
                          'Public Limited',
                        ],
                        onChanged: (val) => setState(() => _businessType = val),
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Ownership (Percentage %) *',
                        controller: _ownershipController,
                        keyboardType: TextInputType.number,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'NTN *',
                        controller: _ntnController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'IssueDate *',
                        controller: _issueDateController,
                        prefixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: _selectIssueDate,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'LOB *',
                        controller: _lobController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Mobile *',
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Nature of Business *',
                        controller: _natureOfBusinessController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Office Address *',
                        controller: _officeAddressController,
                        isMultiline: true,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'P.O Box *',
                        controller: _poBoxController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Company Email *',
                        controller: _companyEmailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'WebSite',
                        controller: _websiteController,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2.h),
              Divider(color: AppColors.onboardingDescription.withOpacity(0.15)),
              SizedBox(height: 1.5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.onboardingDescription
                          .withOpacity(0.15),
                      side: BorderSide.none,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.6.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.onboardingTitle,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginButton,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.6.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _onSave,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
