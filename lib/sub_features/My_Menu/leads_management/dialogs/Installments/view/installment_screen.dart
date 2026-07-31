import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../dialog/new_installment_dialog.dart';
import '../model/installment_model.dart';

class InstallmentsScreen extends StatelessWidget {
  final String customerNumber;
  final String programTitle;
  final String clientName;
  final String city;
  final String contractAmount;
  final String currency;

  const InstallmentsScreen({
    super.key,
    required this.customerNumber,
    required this.programTitle,
    required this.clientName,
    required this.city,
    required this.contractAmount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual API data.
    final installments = <InstallmentModel>[
      const InstallmentModel(
        number: 1,
        description: 'the first instalment done by client.',
        dueDate: '10/06/2026',
        amount: 50000,
        currency: 'PKR',
        exchangeRate: 1,
        totalPkr: 50000,
        payment: '-',
        status: 'Due',
      ),
      const InstallmentModel(
        number: 2,
        description: '2nd installment on ITA.',
        dueDate: '10/07/2026',
        amount: 30000,
        currency: 'PKR',
        exchangeRate: 1,
        totalPkr: 30000,
        payment: '-',
        status: 'Due',
      ),
      const InstallmentModel(
        number: 3,
        description: 'visa filing',
        dueDate: '10/08/2026',
        amount: 20000,
        currency: 'PKR',
        exchangeRate: 1,
        totalPkr: 20000,
        payment: '-',
        status: 'Due',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: Text(
          '$customerNumber : Study Visa : $programTitle',
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          children: [
            // ===== Header card =====
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.popupBackground,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.popupShadow,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CLIENT INFORMATION',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onboardingDescription,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    clientName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onboardingTitle,
                    ),
                  ),
                  Text(
                    city,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                  Text(
                    customerNumber,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                  SizedBox(height: 1.2.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 0.6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Installments are OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(height: 32),
                  Text(
                    'Contract Amount',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 0.7.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          contractAmount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 0.7.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          currency,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 2.h),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bottomNavBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const NewInstallmentDialog(),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white, size: 20),
                label: const Text('New', style: TextStyle(color: Colors.white)),
              ),
            ),

            SizedBox(height: 2.h),

            // ===== Installments list =====
            ...installments.map(
              (installment) => _InstallmentCard(installment: installment),
            ),

            SizedBox(height: 2.h),
            Text(
              'Showing 1 to ${installments.length} of ${installments.length} entries',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.onboardingDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstallmentCard extends StatelessWidget {
  final InstallmentModel installment;

  const _InstallmentCard({required this.installment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        color: AppColors.popupBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.bottomNavBackground.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.popupShadow,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5.5.w,
                backgroundColor: AppColors.bottomNavBackground.withOpacity(0.1),
                child: Text(
                  '${installment.number}',
                  style: TextStyle(
                    color: AppColors.bottomNavBackground,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 2.5.w),
              Expanded(
                child: Text(
                  installment.description,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onboardingTitle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.5.w,
                  vertical: 0.4.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  installment.status,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Wrap(
            spacing: 4.w,
            runSpacing: 1.h,
            children: [
              _infoChip('Due Date', installment.dueDate),
              _infoChip(
                'Amount',
                '${installment.amount.toStringAsFixed(0)} ${installment.currency}',
              ),
              _infoChip('Exchange Rate', '${installment.exchangeRate}'),
              _infoChip('Total PKR', installment.totalPkr.toStringAsFixed(0)),
              _infoChip('Payment', installment.payment),
            ],
          ),
          SizedBox(height: 1.5.h),
          Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton<String>(
              color: AppColors.leadDialogBackground,
              offset: const Offset(0, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) => [
                _menuItem('edit', Icons.edit_outlined, 'Edit'),
                _menuItem('delete', Icons.delete_outline, 'Delete'),
                _menuItem(
                  'generate_payment',
                  Icons.receipt_long_outlined,
                  'Generate Payment',
                ),
                _menuItem(
                  'print_voucher',
                  Icons.print_outlined,
                  'Print Voucher',
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    // TODO: navigate to edit installment
                    break;
                  case 'delete':
                    // TODO: show delete confirmation
                    break;
                  case 'generate_payment':
                    // TODO: generate payment action
                    break;
                  case 'print_voucher':
                    // TODO: print voucher action
                    break;
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.bottomNavBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 1.5.w),
                    const Text(
                      'Actions',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.onboardingDescription,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onboardingTitle,
          ),
        ),
      ],
    );
  }
}

PopupMenuItem<String> _menuItem(String value, IconData icon, String label) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        Icon(icon, size: 20, color: AppColors.onboardingDescription),
        SizedBox(width: 2.5.w),
        Text(
          label,
          style: TextStyle(fontSize: 15.sp, color: AppColors.onboardingTitle),
        ),
      ],
    ),
  );
}
