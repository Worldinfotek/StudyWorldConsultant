part of 'leads_bloc.dart';

abstract class LeadsEvent {}

class LeadsStarted extends LeadsEvent {}

class LeadSelectionToggled extends LeadsEvent {
  final int index;
  LeadSelectionToggled(this.index);
}

class LeadSelectionCleared extends LeadsEvent {}

class LeadsFilterApplied extends LeadsEvent {
  // TODO: Add actual filter fields once wired to API.
}