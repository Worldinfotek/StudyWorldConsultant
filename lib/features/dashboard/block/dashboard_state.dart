part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<DashboardCardModel> cards;
  DashboardLoaded(this.cards);
}