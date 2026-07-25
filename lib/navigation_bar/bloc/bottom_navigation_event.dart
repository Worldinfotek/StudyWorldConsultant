part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent {}

class NavigationTabChanged extends BottomNavigationEvent {
  final int index;
  NavigationTabChanged(this.index);
}