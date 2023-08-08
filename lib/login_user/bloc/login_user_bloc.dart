import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums.dart';
import '../../repositories/authentication_repository.dart';
import 'login_user_event.dart';
import 'login_user_state.dart';

class LogInUserBloc extends Bloc<LoginUserEvent, LogInUserState> {
  LogInUserBloc({required this.authenticationRepository})
      : super(const LogInUserState()) {
    on<LogInUser>(_onLoginUser);
  }
  final AuthenticationRepository authenticationRepository;

  Future<void> _onLoginUser(
      LogInUser event, Emitter<LogInUserState> emit) async {
    emit(state.copyWith(
      email: event.email,
      password: event.password,
      status: UserFormStatus.submitting,
    ));
    try {
      await authenticationRepository.logInUser(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(
        status: UserFormStatus.success,
      ));
    } on LogInFailure catch (e) {
      emit(state.copyWith(
        status: UserFormStatus.failure,
        error: e.message,
      ));
    }
  }
}
