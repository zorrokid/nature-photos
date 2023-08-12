import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/bloc/user/auth_event.dart';
import 'package:nature_photos/bloc/user/auth_state.dart';

import '../../repositories/authentication_repository.dart';
import '../../reset_password/bloc/reset_password_event.dart';
import 'auth_status.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authenticationRepository})
      : super(const AuthState()) {
    on<LogOutUser>(_onLogOutUser);
    //on<ResetPassword>(_onResetPassword);
  }
  final AuthenticationRepository authenticationRepository;

  Future<void> _onLogOutUser(LogOutUser event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      status: AuthStatus.processing,
    ));
    await authenticationRepository.logOutUser();
    emit(state.copyWith(
      status: AuthStatus.success,
    ));
  }

  /*Future<void> _onResetPassword(
      ResetPassword event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.processing,
      ));
      await authenticationRepository.resetPassword(event.email);
      emit(state.copyWith(
        status: AuthStatus.success,
      ));
    } on AuthFailure catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        error: e.message,
      ));
    }
  }*/
}
