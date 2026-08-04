import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../card/kyc_bank_detail_card/kyc_bank_detail_card.dart';
import '../kyc_bank_details/kyc_bank_detail_dialog.dart';
import '../models/kyc_bank_detail_model.dart';

class KycBankDetailsScreen extends StatefulWidget {
  final String leadName;

  const KycBankDetailsScreen({super.key, required this.leadName});

  @override
  State<KycBankDetailsScreen> createState() => _KycBankDetailsScreenState();
}

class _KycBankDetailsScreenState extends State<KycBankDetailsScreen> {
  final List<KycBankDetailModel> _records = [
    KycBankDetailModel(
      bankName: "Habib Bank Limited (HBL)",
      accountTitle: "Muhammad Shahzaib",
      accountNumber: "1234567890123456",
      iban: "PK36HABB0000001234567890",
      accountCurrency: "PKR",
      swiftCode: "HABBPKKA",
      bankAddress: "Main Boulevard, Lahore, Pakistan",
      email: "shahzaib@example.com",
    ),
  ]; // TODO: load from API

  void _openAddForm() {
    showDialog(
      context: context,
      builder: (_) => KycBankDetailsFormDialog(
        onSave: (record) => setState(() => _records.add(record)),
      ),
    );
  }

  void _openEditForm(int index) {
    showDialog(
      context: context,
      builder: (_) => KycBankDetailsFormDialog(
        existingRecord: _records[index],
        onSave: (record) => setState(() => _records[index] = record),
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Delete Record'),
        content: Text('Delete "${_records[index].bankName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() => _records.removeAt(index));
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: Text(
          '${widget.leadName}: Bank Details',
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: _records.isEmpty
            ? Center(
                child: Text(
                  'No records to display',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: AppColors.onboardingDescription,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(4.w),
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  return KycBankDetailCard(
                    record: _records[index],
                    onEdit: () => _openEditForm(index),
                    onDelete: () => _confirmDelete(index),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.bottomNavBackground,
        onPressed: _openAddForm,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
