import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../model/customer_tracking_model.dart';

class CustomerTrackingScreen extends StatelessWidget {
  final String leadName;
  final String contactNumber;
  final String trackingNumber;

  const CustomerTrackingScreen({
    super.key,
    required this.leadName,
    required this.contactNumber,
    this.trackingNumber = '',
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual API data.
    final List<TrackingModel> trackingItems = [
      TrackingModel(
        title: "Shahzaib",
        description: "I am developer",
        color: "Red",
        leftAligned: true,
        shownToClient: true,
        status: "Pending",
        time: "11:50 AM",
      ),
      TrackingModel(
        title: "Mubashir",
        description: "Mubashir is a Dotnet Developer",
        color: "Green",
        leftAligned: true,
        shownToClient: false,
        status: "Done",
        time: "12:50 PM",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: const Text(
          'Customer Tracking',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          children: [
            // ===== Header info =====
            Container(
              padding: EdgeInsets.all(3.5.w),
              decoration: BoxDecoration(
                color: AppColors.popupBackground,
                borderRadius: BorderRadius.circular(12),
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
                  Text(
                    'CustomerTracking => $leadName ($contactNumber)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onboardingTitle,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    'Tracking Number: ${trackingNumber.isEmpty ? '-' : trackingNumber}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.onboardingDescription,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: EdgeInsets.symmetric(vertical: 1.4.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // TODO: navigate/show status page link visible to customer
                      },
                      child: Text(
                        'Status page visible to the Customer',
                        textAlign: TextAlign.center,
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

            SizedBox(height: 2.h),

            // ===== Action buttons =====
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginButton,
                      padding: EdgeInsets.symmetric(vertical: 1.4.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: navigate to Add Tracking form
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 18),
                    label: Text(
                      'Add Tracking',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginButton,
                      padding: EdgeInsets.symmetric(vertical: 1.4.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: import tracking data
                    },
                    icon: const Icon(
                      Icons.file_download_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      'Import Tracking',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 3.h),

            // ===== Tracking list / empty state =====
            if (trackingItems.isEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.popupBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'No data available',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: AppColors.onboardingDescription,
                  ),
                ),
              )
            else
              ...trackingItems.map((item) => _TrackingCard(item: item)),
          ],
        ),
      ),
    );
  }
}

class _TrackingCard extends StatelessWidget {
  final TrackingModel item;

  const _TrackingCard({required this.item});

  Color get _statusColor {
    switch (item.status.toLowerCase()) {
      case 'completed':
      case 'done':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
      case 'failed':
        return Colors.redAccent;
      default:
        return Colors.blueGrey;
    }
  }

  Color get _accentColor {
    try {
      return Color(int.parse(item.color.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.bottomNavBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.8.h),
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
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left accent bar — reflects the item's color
            Container(
              width: 1.2.w,
              decoration: BoxDecoration(
                color: _accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(3.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + menu
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _labeledSection(
                            label: 'Title',
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onboardingTitle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.w,
                          width: 4.w,
                          child: PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.more_vert,
                              color: AppColors.onboardingDescription,
                              size: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            itemBuilder: (context) => [
                              _menuItem('edit', Icons.edit_outlined, 'Edit'),
                              _menuItem(
                                'delete',
                                Icons.delete_outline,
                                'Delete',
                              ),
                            ],
                            onSelected: (value) {
                              // TODO: handle edit/delete
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 1.6.h),

                    // Description
                    _labeledSection(
                      label: 'Description',
                      child: Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.onboardingDescription,
                          height: 1.4,
                        ),
                      ),
                    ),

                    SizedBox(height: 1.6.h),

                    // Color + Upload — side by side
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _labeledSection(
                            label: 'Color',
                            child: Row(
                              children: [
                                Container(
                                  width: 4.5.w,
                                  height: 4.5.w,
                                  decoration: BoxDecoration(
                                    color: _accentColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _accentColor.withOpacity(0.3),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  item.color,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.onboardingDescription,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: _labeledSection(
                            label: 'Upload',
                            child: item.uploadPath != null
                                ? InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      // TODO: open/preview uploaded file
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w,
                                        vertical: 0.8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.bottomNavBackground
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.attach_file,
                                            size: 20,
                                            color:
                                                AppColors.bottomNavBackground,
                                          ),
                                          SizedBox(width: 1.w),
                                          Flexible(
                                            child: Text(
                                              'View File',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors
                                                    .bottomNavBackground,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Text(
                                    'No file',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.onboardingDescription
                                          .withOpacity(0.6),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 1.6.h),
                    Divider(
                      height: 1,
                      color: AppColors.onboardingDescription.withOpacity(0.12),
                    ),
                    SizedBox(height: 1.4.h),

                    // Footer row: status badge, visibility, time
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.5.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: _statusColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 1.5.w,
                                height: 1.5.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _statusColor,
                                ),
                              ),
                              SizedBox(width: 1.5.w),
                              Text(
                                item.status,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: _statusColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.5.w),
                        Icon(
                          item.shownToClient
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 15,
                          color: item.shownToClient
                              ? Colors.green
                              : AppColors.onboardingDescription,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          item.shownToClient ? 'Visible to client' : 'Hidden',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: item.shownToClient
                                ? Colors.green
                                : AppColors.onboardingDescription,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.access_time,
                          size: 20,
                          color: AppColors.onboardingDescription,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          item.time,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.onboardingDescription,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labeledSection({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: AppColors.onboardingDescription.withOpacity(0.6),
          ),
        ),
        SizedBox(height: 0.4.h),
        child,
      ],
    );
  }

  PopupMenuItem<String> _menuItem(String value, IconData icon, String label) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.onboardingDescription),
          SizedBox(width: 2.5.w),
          Text(label, style: TextStyle(fontSize: 12.5.sp)),
        ],
      ),
    );
  }
}
