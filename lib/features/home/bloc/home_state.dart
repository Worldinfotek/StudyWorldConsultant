part of 'home_bloc.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeCardModel> cards;
  HomeLoaded(this.cards);
}