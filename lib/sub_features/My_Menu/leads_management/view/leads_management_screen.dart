import 'package:OWILC/core/routes/spp_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';
import '../bloc/leads_bloc.dart';
import '../bottom_sheet/leads_filter_bottom_sheet.dart';
import '../card/lead_state_card.dart';
import '../dialogs/share_to_processing_dialog.dart';
import '../tile/lead_list_tile.dart';

class LeadsManagementScreen extends StatelessWidget {
  const LeadsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LeadsBloc()..add(LeadsStarted()),
      child: const _LeadsView(),
    );
  }
}

class _LeadsView extends StatelessWidget {
  const _LeadsView();

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LeadsFilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavBackground,
        title: const Text(
          'Leads Management',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocBuilder<LeadsBloc, LeadsState>(
          builder: (context, state) {
            if (state is! LeadsLoaded) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.bottomNavBackground,
                ),
              );
            }

            return Column(
              children: [
                // ===== Top stat cards + filter icon =====
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 1.5.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: LeadStatCard(
                                    title: 'Supervisor',
                                    icon: Icons.person_outline,
                                    color: Color(0xFF6B6B6B),
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                const Expanded(
                                  child: LeadStatCard(
                                    title: 'New Calls: 0/0',
                                    icon: Icons.call_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.w),
                            Row(
                              children: [
                                const Expanded(
                                  child: LeadStatCard(
                                    title: 'Meetings: 0/0',
                                    icon: Icons.groups_outlined,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: LeadStatCard(
                                    title: 'Sales Done: 0/0',
                                    icon: Icons.shopping_bag_outlined,
                                    color: AppColors.bottomNavBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      InkWell(
                        onTap: () => _openFilterSheet(context),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(2.5.w),
                          decoration: BoxDecoration(
                            color: AppColors.bottomNavBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ===== Bulk action bar (shows when any checkbox selected) =====
                if (state.hasSelection)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 1.h,
                    ),
                    color: AppColors.bottomNavBackground.withOpacity(0.06),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _bulkActionChip('Change Ownership'),
                          _bulkActionChip('Delete'),
                          _bulkActionChip('Edit'),
                          _bulkActionChip('Refer To DSU'),
                          _bulkActionChip('Share To Processing', () {

                            final selectedNames = state.selectedIndexes
                                .map((index) => state.leads[index].name)
                                .toList();

                            showDialog(
                              context: context,
                              builder: (_) => ShareToProcessingDialog(selectedLeadNames: selectedNames),
                            );

                          }),
                          _bulkActionChip('Share To Operations'),
                          _bulkActionChip('Share To Branch Manager'),
                          _bulkActionChip('Download File'),
                          _bulkActionChip('KYC Form'),
                          _bulkActionChip('Contract Amount'),
                          _bulkActionChip('Generate Contract'),
                          _bulkActionChip('Installments'),
                          _bulkActionChip('Upload'),
                          _bulkActionChip('Customer Tracking'),
                        ],
                      ),
                    ),
                  ),

                // ===== Leads list =====
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    itemCount: state.leads.length,
                    itemBuilder: (context, index) {
                      final lead = state.leads[index];
                      return LeadListTile(
                        lead: lead,
                        isSelected: state.selectedIndexes.contains(index),
                        onCheckboxChanged: (_) {
                          context.read<LeadsBloc>().add(
                            LeadSelectionToggled(index),
                          );
                        },
                        onDelete: () {
                          // TODO: delete confirmation + API call
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: 'totalLeadAssigned',
            backgroundColor: AppColors.bottomNavBackground,
            onPressed: () {
              // TODO: show total lead assigned info
            },
            icon: const Icon(
              Icons.assignment_ind_outlined,
              color: Colors.white,
            ),
            label: const Text(
              'Total Leads',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 1.5.h),
          FloatingActionButton.extended(
            heroTag: 'addLead',
            backgroundColor: AppColors.bottomNavBackground,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addLeadsScreen);
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add Lead',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulkActionChip(String label, [VoidCallback? onTap]) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: ActionChip(
        label: Text(label, style: const TextStyle(fontSize: 11)),
        backgroundColor: Colors.white,
        side: BorderSide(color: AppColors.bottomNavBackground.withOpacity(0.3)),
        onPressed: onTap,
      ),
    );
  }
}
