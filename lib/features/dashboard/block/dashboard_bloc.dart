import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/dashboard_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardLoading()) {
    on<DashboardStarted>(_onHomeStarted);
  }

  Future<void> _onHomeStarted(
      DashboardStarted event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    // TODO: Replace this dummy list with an actual API call later.
    final dummyCards = <DashboardCardModel>[

      const DashboardCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const DashboardCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const DashboardCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const DashboardCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const DashboardCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const DashboardCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const DashboardCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const DashboardCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const DashboardCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const DashboardCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const DashboardCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const DashboardCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const DashboardCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const DashboardCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const DashboardCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
    ];

    emit(DashboardLoaded(dummyCards));
  }
}
