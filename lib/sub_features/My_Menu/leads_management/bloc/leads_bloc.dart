import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/lead_model.dart';

part 'leads_event.dart';
part 'leads_state.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  LeadsBloc() : super(LeadsLoading()) {
    on<LeadsStarted>(_onStarted);
    on<LeadSelectionToggled>(_onSelectionToggled);
    on<LeadSelectionCleared>(_onSelectionCleared);
  }

  Future<void> _onStarted(LeadsStarted event, Emitter<LeadsState> emit) async {
    emit(LeadsLoading());

    // TODO: Replace with actual API call later.
    final dummyLeads = <LeadModel>[
      const LeadModel(
        date: '28/07/2026',
        name: 'Test lead',
        contactNumber: '03001234567',
        country: 'Pakistan',
        leadStatus: 'Contacted',
        programCategory: 'Ph.D. Program',
        city: 'Lahore',
        age: '27',
      ),
      const LeadModel(
        date: '27/07/2026',
        name: 'Ahmed Raza',
        contactNumber: '03211234567',
        country: 'UK',
        leadStatus: 'New',
        programCategory: 'Masters',
        city: 'Karachi',
        age: '24',
      ),
      const LeadModel(
        date: '26/07/2026',
        name: 'Sara Khan',
        contactNumber: '03451234567',
        country: 'Canada',
        leadStatus: 'Follow Up',
        programCategory: 'Bachelors',
        city: 'Islamabad',
        age: '22',
      ),
    ];

    emit(LeadsLoaded(leads: dummyLeads));
  }

  void _onSelectionToggled(LeadSelectionToggled event, Emitter<LeadsState> emit) {
    final currentState = state;
    if (currentState is! LeadsLoaded) return;

    final updated = Set<int>.from(currentState.selectedIndexes);
    if (updated.contains(event.index)) {
      updated.remove(event.index);
    } else {
      updated.add(event.index);
    }

    emit(currentState.copyWith(selectedIndexes: updated));
  }

  void _onSelectionCleared(LeadSelectionCleared event, Emitter<LeadsState> emit) {
    final currentState = state;
    if (currentState is! LeadsLoaded) return;
    emit(currentState.copyWith(selectedIndexes: {}));
  }
}