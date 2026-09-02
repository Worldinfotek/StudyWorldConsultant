import 'package:OWILC/api/auth_token/services/token_storage_service.dart';
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

      if(!response.isSuccess){
        emit(LoginFailure(message: "Something wents wrong. Please try again"));
        return;
      }

      try {

        /// token response
        final tokenResponse = await authRepository.getToken(
            username: event.userNameOrEmailAddress,
            password: event.password
        );

        /// user payload
        final userPayload = authRepository.decodeToken(
            tokenResponse.accessToken
        );

        /// token + user payload save
        await TokenStorageService.saveSession(
            token: tokenResponse.accessToken,
            user: userPayload
        );

        emit(LoginSuccess(description: response.description));



      } catch
      (token_Exception, stackTrace)
      {
        print("TOKEN API ERROR: $token_Exception");
        print("STACK TRACE: $stackTrace");
          emit(
              const LoginFailure(
                  message: "Login succeeded but session could not be created. Please try again.")
          );
      }
    } catch
    (Exception)
    {
          emit(const LoginFailure(
              message: "Something wents wrong. Please try again")
          );
    }
  }
}
