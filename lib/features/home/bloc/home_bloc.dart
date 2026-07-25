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
      const HomeCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const HomeCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const HomeCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const HomeCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const HomeCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const HomeCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const HomeCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const HomeCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const HomeCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const HomeCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const HomeCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const HomeCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const HomeCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const HomeCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const HomeCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const HomeCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const HomeCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const HomeCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const HomeCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const HomeCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const HomeCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const HomeCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const HomeCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const HomeCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const HomeCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const HomeCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const HomeCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const HomeCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
      const HomeCardModel(
        title: 'Visa Services',
        description: 'Explore visa categories',
        icon: Icons.assignment_outlined,
      ),
      const HomeCardModel(
        title: 'Study Abroad',
        description: 'Top universities',
        icon: Icons.school_outlined,
      ),
      const HomeCardModel(
        title: 'Work Permits',
        description: 'Employment visas',
        icon: Icons.work_outline,
      ),
      const HomeCardModel(
        title: 'Immigration',
        description: 'PR & settlement',
        icon: Icons.flight_takeoff_outlined,
      ),
      const HomeCardModel(
        title: 'Consultation',
        description: 'Book an expert',
        icon: Icons.support_agent_outlined,
      ),
      const HomeCardModel(
        title: 'Documents',
        description: 'Track your files',
        icon: Icons.folder_outlined,
      ),
      const HomeCardModel(
        title: 'Applications',
        description: 'Track status',
        icon: Icons.description_outlined,
      ),
    ];

    emit(HomeLoaded(dummyCards));
  }
}
