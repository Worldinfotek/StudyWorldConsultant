import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../../my_personal_information/widgets/my_personal_info_text_field.dart';


class GenerateContractDialog extends StatefulWidget {
  final String clientName;
  final String cnic;
  final String city;

  const GenerateContractDialog({
    super.key,
    required this.clientName,
    required this.cnic,
    required this.city,
  });

  @override
  State<GenerateContractDialog> createState() => _GenerateContractDialogState();
}

class _GenerateContractDialogState extends State<GenerateContractDialog> {
  late final TextEditingController _clientNameController;
  late final TextEditingController _cnicController;
  late final TextEditingController _locationController;
  final _passportController = TextEditingController();
  final _sdwOfController = TextEditingController();
  final _emailController = TextEditingController();
  final _presentAddressController = TextEditingController();
  final _contractDateController = TextEditingController();

  bool _hasSpecialTerms = false;

  @override
  void initState() {
    super.initState();
    _clientNameController = TextEditingController(text: widget.clientName);
    _cnicController = TextEditingController(text: widget.cnic);
    _locationController = TextEditingController(text: widget.city);
    _contractDateController.text =
    '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}';
  }

  @override
  void dispose() {
    _clientNameController.dispose();
    _cnicController.dispose();
    _locationController.dispose();
    _passportController.dispose();
    _sdwOfController.dispose();
    _emailController.dispose();
    _presentAddressController.dispose();
    _contractDateController.dispose();
    super.dispose();
  }

  Future<void> _selectContractDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      _contractDateController.text =
      '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    'Contract Fields',
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
                      label: 'Client Name',
                      controller: _clientNameController,
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'CNIC',
                      controller: _cnicController,
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'Location (city)',
                      controller: _locationController,
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'PASSPORT',
                      controller: _passportController,
                      hintText: 'Enter passport number',
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'S/D/W OF',
                      controller: _sdwOfController,
                      hintText: 'Son/Daughter/Wife of',
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'EMAIL',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter email',
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'Present Address',
                      controller: _presentAddressController,
                      isMultiline: true,
                      hintText: 'Present address',
                    ),
                    SizedBox(height: 2.h),
                    MyPersonalInfoTextField(
                      label: 'Contract Date',
                      controller: _contractDateController,
                      prefixIcon: Icons.calendar_today_outlined,
                      readOnly: true,
                      onTap: _selectContractDate,
                    ),
                    SizedBox(height: 1.h),
                    CheckboxListTile(
                      value: _hasSpecialTerms,
                      onChanged: (val) => setState(() => _hasSpecialTerms = val ?? false),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.bottomNavBackground,
                      title: Text(
                        'Have Special Terms',
                        style: TextStyle(fontSize: 12.5.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 1.6.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // TODO: Wire up to API / Bloc event.
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save & Generate Sample',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}