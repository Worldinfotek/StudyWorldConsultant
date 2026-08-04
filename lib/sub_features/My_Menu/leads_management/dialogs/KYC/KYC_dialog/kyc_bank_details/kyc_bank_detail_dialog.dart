import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../../../../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../models/kyc_bank_detail_model.dart';

class KycBankDetailsFormDialog extends StatefulWidget {
  final KycBankDetailModel? existingRecord;
  final void Function(KycBankDetailModel record) onSave;

  const KycBankDetailsFormDialog({
    super.key,
    this.existingRecord,
    required this.onSave,
  });

  @override
  State<KycBankDetailsFormDialog> createState() =>
      _KycBankDetailsFormDialogState();
}

class _KycBankDetailsFormDialogState extends State<KycBankDetailsFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final _bankNameController = TextEditingController(
    text: widget.existingRecord?.bankName,
  );
  late final _accountTitleController = TextEditingController(
    text: widget.existingRecord?.accountTitle,
  );
  late final _accountNumberController = TextEditingController(
    text: widget.existingRecord?.accountNumber,
  );
  late final _ibanController = TextEditingController(
    text: widget.existingRecord?.iban,
  );
  late final _accountCurrencyController = TextEditingController(
    text: widget.existingRecord?.accountCurrency,
  );
  late final _swiftCodeController = TextEditingController(
    text: widget.existingRecord?.swiftCode,
  );
  late final _bankAddressController = TextEditingController(
    text: widget.existingRecord?.bankAddress,
  );
  late final _emailController = TextEditingController(
    text: widget.existingRecord?.email,
  );
  late final _websiteController = TextEditingController(
    text: widget.existingRecord?.website,
  );
  late final _concernPersonController = TextEditingController(
    text: widget.existingRecord?.concernPerson,
  );

  bool get _isEdit => widget.existingRecord != null;

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountTitleController.dispose();
    _accountNumberController.dispose();
    _ibanController.dispose();
    _accountCurrencyController.dispose();
    _swiftCodeController.dispose();
    _bankAddressController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _concernPersonController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        KycBankDetailModel(
          bankName: _bankNameController.text,
          accountTitle: _accountTitleController.text,
          accountNumber: _accountNumberController.text,
          iban: _ibanController.text,
          accountCurrency: _accountCurrencyController.text,
          swiftCode: _swiftCodeController.text,
          bankAddress: _bankAddressController.text,
          email: _emailController.text,
          website: _websiteController.text,
          concernPerson: _concernPersonController.text,
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
                      _isEdit ? 'Edit Bank Detail' : 'New Bank Detail',
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
                        label: 'Bank Name *',
                        controller: _bankNameController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Account Title *',
                        controller: _accountTitleController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Account Number *',
                        controller: _accountNumberController,
                        keyboardType: TextInputType.number,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'IBAN *',
                        controller: _ibanController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Account Currency *',
                        controller: _accountCurrencyController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Swift Code *',
                        controller: _swiftCodeController,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Bank Address *',
                        controller: _bankAddressController,
                        isMultiline: true,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Email *',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _requiredValidator,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'WebSite',
                        controller: _websiteController,
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Concern Person',
                        controller: _concernPersonController,
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
                        fontSize: 13.sp,
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
                        fontSize: 13.sp,
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
