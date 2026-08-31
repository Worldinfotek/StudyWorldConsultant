import 'package:equatable/equatable.dart';

/// mother class of handle events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// handle login button press event
class LoginButtonPressed extends LoginEvent {
  final String userNameOrEmailAddress;
  final String password;
  final bool rememberMe;

  /// const constructor initialization
  const LoginButtonPressed({
    required this.userNameOrEmailAddress,
    required this.password,
    this.rememberMe = false,
  });

  /// get props with override method
  /// don't edit this method without changing its state
  @override
  List<Object?> get props => [userNameOrEmailAddress, password, rememberMe];
}
