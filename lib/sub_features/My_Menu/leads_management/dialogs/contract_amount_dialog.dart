import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../../my_personal_information/widgets/my_personal_info_text_field.dart';
import '../dropdown/custom_dropdown.dart';


class ContractAmountDialog extends StatefulWidget {
  const ContractAmountDialog({super.key});

  @override
  State<ContractAmountDialog> createState() => _ContractAmountDialogState();
}

class _ContractAmountDialogState extends State<ContractAmountDialog> {
  final _contractAmountController = TextEditingController();
  String? _currency = 'PKR';

  @override
  void dispose() {
    _contractAmountController.dispose();
    super.dispose();
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
                    'Installment Fields',
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

            MyPersonalInfoTextField(
              label: 'Contract Amount',
              controller: _contractAmountController,
              keyboardType: TextInputType.number,
              hintText: 'Enter contract amount',
            ),
            SizedBox(height: 2.h),

            CustomDropdownField(
              label: 'Contract Currency',
              value: _currency,
              items: const ['PKR', 'USD', 'GBP', 'CAD', 'AUD'],
              onChanged: (val) => setState(() => _currency = val),
            ),

            SizedBox(height: 3.h),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.6.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // TODO: Wire up to API / Bloc event.
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save',
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