
part of 'onboarding_bloc.dart';

class OnboardingState
{
  ///================================
  /// current page variable
  ///================================
  final int currentPage;

  ///===============================
  /// constructor
  ///===============================
  const OnboardingState({this.currentPage = 0});

  ///=====================================
  /// copy with method to change the state
  ///=====================================
  OnboardingState copyWith({int? currentPage})
  {
    return OnboardingState(currentPage: currentPage ?? this.currentPage);
  }
}