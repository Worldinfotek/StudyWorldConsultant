import 'package:equatable/equatable.dart';

/// mother class of login states
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

///=============================
/// handle states
/// ============================

///=== initial state
class LoginInitial extends LoginState {}

///=== loading state
class LoginLoading extends LoginState {}

///=== success state
class LoginSuccess extends LoginState {
  final String description;

  const LoginSuccess({required this.description});

  @override
  List<Object?> get props => [description];
}

///=== failure state
class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
