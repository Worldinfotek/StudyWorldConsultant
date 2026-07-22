import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashInProgress());

    // Total time splash stays visible before navigating away.
    // Adjust as needed once real logo/animation timing is finalized.
    await Future.delayed(const Duration(seconds: 5));

    emit(SplashCompleted());
  }
}
