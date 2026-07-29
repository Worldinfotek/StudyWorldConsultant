import 'package:OWILC/core/routes/spp_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeStarted>(_onHomeStarted);
  }

  Future<void> _onHomeStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    // TODO: Replace this dummy list with an actual API call later.
    final dummyCards = <HomeCardModel>[
      HomeCardModel(
        title: 'My Personal Information',
        description: '',
        icon: Icons.description_outlined,
        routeName: AppRoutes.myPersonalInfoScreen,
      ),

       HomeCardModel(
        title: 'Leads Management',
        description: '',
        icon: Icons.assignment_outlined,
        routeName: AppRoutes.leadsManagement
      ),

      const HomeCardModel(
        title: 'Processing',
        description: '',
        icon: Icons.settings_outlined,
      ),

      const HomeCardModel(
        title: 'Day Book',
        description: '',
        icon: Icons.menu_book_outlined,
      ),

      const HomeCardModel(
        title: 'My Tasks',
        description: '',
        icon: Icons.task_alt_outlined,
      ),

      const HomeCardModel(
        title: 'Mission Statement',
        description: '',
        icon: Icons.flag_outlined,
      ),

      const HomeCardModel(
        title: 'Inactive Users',
        description: '',
        icon: Icons.person_off_outlined,
      ),

      const HomeCardModel(
        title: 'Employee Tasks',
        description: '',
        icon: Icons.assignment_ind_outlined,
      ),

      const HomeCardModel(
        title: 'Customer Payments',
        description: '',
        icon: Icons.payments_outlined,
      ),

      const HomeCardModel(
        title: 'All Installments',
        description: '',
        icon: Icons.account_balance_wallet_outlined,
      ),

      const HomeCardModel(
        title: 'Bank Details',
        description: '',
        icon: Icons.account_balance_outlined,
      ),

      const HomeCardModel(
        title: 'Staff Attendance',
        description: '',
        icon: Icons.access_time_outlined,
      ),

      const HomeCardModel(
        title: 'My Notifications',
        description: '',
        icon: Icons.notifications_outlined,
      ),

      const HomeCardModel(
        title: 'My Pay Slips',
        description: '',
        icon: Icons.receipt_long_outlined,
      ),

      const HomeCardModel(
        title: 'Leave Requests',
        description: '',
        icon: Icons.calendar_today_outlined,
      ),

      const HomeCardModel(
        title: 'Approve Leave Requests (HR)',
        description: '',
        icon: Icons.fact_check_outlined,
      ),

      const HomeCardModel(
        title: 'Approve Leave Requests (Supervisor)',
        description: '',
        icon: Icons.verified_outlined,
      ),

      const HomeCardModel(
        title: 'Manage Tracking Steps',
        description: '',
        icon: Icons.track_changes_outlined,
      ),

      const HomeCardModel(
        title: 'Processing Escalations',
        description: '',
        icon: Icons.access_time_outlined,
      ),

      const HomeCardModel(
        title: 'Complaints Escalations',
        description: '',
        icon: Icons.report_problem_outlined,
      ),

      const HomeCardModel(
        title: 'SMS Log',
        description: '',
        icon: Icons.sms_outlined,
      ),

      const HomeCardModel(
        title: 'Visitor Log',
        description: '',
        icon: Icons.people_outline,
      ),
    ];

    emit(HomeLoaded(dummyCards));
  }
}
