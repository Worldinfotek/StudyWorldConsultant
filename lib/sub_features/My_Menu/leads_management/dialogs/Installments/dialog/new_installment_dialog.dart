import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../../../dropdown/custom_dropdown.dart';

class NewInstallmentDialog extends StatefulWidget {
  const NewInstallmentDialog({super.key});

  @override
  State<NewInstallmentDialog> createState() => _NewInstallmentDialogState();
}

class _NewInstallmentDialogState extends State<NewInstallmentDialog> {
  final _formKey = GlobalKey<FormState>();

  final _installmentNoController = TextEditingController(text: '0');
  final _descriptionController = TextEditingController();
  final _extraNoteController = TextEditingController();
  final _amountController = TextEditingController(text: '0');
  final _dueDateController = TextEditingController();

  String? _currency = 'PKR';

  @override
  void dispose() {
    _installmentNoController.dispose();
    _descriptionController.dispose();
    _extraNoteController.dispose();
    _amountController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      _dueDateController.text =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      // TODO: Wire up to API / Bloc event.
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.leadDialogBackground,
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
              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'New Installment',
                      style: TextStyle(
                        fontSize: 16.sp,
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
                        label: 'Installment No *',
                        controller: _installmentNoController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Installment No is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Payment Stage Description *',
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Payment Stage Description is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Extra Note',
                        controller: _extraNoteController,
                      ),
                      SizedBox(height: 2.h),
                      CustomDropdownField(
                        label: 'Currency',
                        value: _currency,
                        items: const ['PKR', 'USD', 'GBP', 'CAD', 'AUD'],
                        onChanged: (val) => setState(() => _currency = val),
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Amount *',
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Amount is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      MyPersonalInfoTextField(
                        label: 'Due Date',
                        controller: _dueDateController,
                        prefixIcon: Icons.calendar_today_outlined,
                        hintText: 'mm/dd/yyyy',
                        readOnly: true,
                        onTap: _selectDueDate,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 3.h),

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
