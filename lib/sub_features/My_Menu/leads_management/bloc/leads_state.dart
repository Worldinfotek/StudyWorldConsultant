part of 'leads_bloc.dart';

abstract class LeadsState {}

class LeadsLoading extends LeadsState {}

class LeadsLoaded extends LeadsState {
  final List<LeadModel> leads;
  final Set<int> selectedIndexes;

  LeadsLoaded({required this.leads, this.selectedIndexes = const {}});

  bool get hasSelection => selectedIndexes.isNotEmpty;

  LeadsLoaded copyWith({List<LeadModel>? leads, Set<int>? selectedIndexes}) {
    return LeadsLoaded(
      leads: leads ?? this.leads,
      selectedIndexes: selectedIndexes ?? this.selectedIndexes,
    );
  }
}
