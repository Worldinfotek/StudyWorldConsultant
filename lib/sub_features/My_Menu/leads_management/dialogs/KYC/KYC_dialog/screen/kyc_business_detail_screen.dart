import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/colors/app_colors.dart';
import '../card/kyc_business_detail_card/kyc_business_detail_card.dart';
import '../kyc_business_details/kyc_business_detail_dialog.dart';
import '../models/kyc_business_detail_model.dart';

class KycBusinessDetailsScreen extends StatefulWidget {
  final String leadName;

  const KycBusinessDetailsScreen({super.key, required this.leadName});

  @override
  State<KycBusinessDetailsScreen> createState() =>
      _KycBusinessDetailsScreenState();
}

class _KycBusinessDetailsScreenState extends State<KycBusinessDetailsScreen> {
  final List<KycBusinessDetailModel> _records = [
    KycBusinessDetailModel(
      companyName: "ABC Technologies (Pvt.) Ltd.",
      companyLegalStatus: "Private Limited Company",
      businessType: "Sole Proprietorship",
      ownershipPercentage: "100%",
      ntn: "1234567-8",
      issueDate: "2022-05-15",
      lob: "Software Development",
      mobile: "+92 300 1234567",
      natureOfBusiness:
          "Software Development, Web Applications, and IT Consulting",
      officeAddress:
          "Office #12, 3rd Floor, Business Plaza, Blue Area, Islamabad, Pakistan",
      poBox: "44000",
      companyEmail: "info@abctech.com",
    ),
  ]; // TODO: load from API

  void _openAddForm() {
    showDialog(
      context: context,
      builder: (_) => KycBusinessDetailsFormDialog(
        onSave: (record) => setState(() => _records.add(record)),
      ),
    );
  }

  void _openEditForm(int index) {
    showDialog(
      context: context,
      builder: (_) => KycBusinessDetailsFormDialog(
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
        content: Text('Delete "${_records[index].companyName}"?'),
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
          '${widget.leadName}: Business Owner',
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
                  return KycBusinessDetailCard(
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
