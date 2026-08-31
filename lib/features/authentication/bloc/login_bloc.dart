import 'package:OWILC/features/authentication/bloc/login_event.dart';
import 'package:OWILC/features/authentication/bloc/login_state.dart';
import 'package:OWILC/features/authentication/model/login_request_model.dart';
import 'package:OWILC/features/authentication/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// get repo........
  final AuthRepository authRepository;

  /// initial constructor
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  /// private login button pressed method
  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    /// try catch block
    try {
      /// taking response auth repo
      final response = await authRepository.login(
        LoginRequestModel(
          userNameOrEmailAddress: event.userNameOrEmailAddress,
          password: event.password,
          rememberMe: event.rememberMe,
        ),
      );

      /// validation
      if (response.isSuccess) {
        emit(LoginSuccess(description: response.description));
      } else {
        emit(LoginFailure(message: "Something wents wrong. Please try again"));
      }
    } catch (exception) {}
  }
}
