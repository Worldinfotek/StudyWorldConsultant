part of 'splash_bloc.dart';

abstract class SplashEvent {}

/// Fired when the splash screen loads, to start the timer/logic.
class SplashStarted extends SplashEvent {}
