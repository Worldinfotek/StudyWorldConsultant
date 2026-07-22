
part of 'onboarding_bloc.dart';

///=================================
/// Root class
///=================================
abstract  class OnboardingEvent {}

///=================================
/// event class
///=================================
class OnboardingPageChanged extends OnboardingEvent
{
  // page index variable
  final int pageIndex;

  // constructor
  OnboardingPageChanged(this.pageIndex);
}