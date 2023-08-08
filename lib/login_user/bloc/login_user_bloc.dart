import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_user_event.dart';
import 'login_user_state.dart';
import 'login_user_status.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  LoginUserBloc() : super(const LoginUserState()) {
    on<LoginUser>(_onLoginUser);
  }

  Future<void> _onLoginUser(
      LoginUser event, Emitter<LoginUserState> emit) async {
    emit(state.copyWith(
      email: event.email,
      password: event.password,
      status: LoginUserStatus.submitting,
    ));

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(state.copyWith(
        status: LoginUserStatus.success,
        userCredential: userCredential,
      ));
    } on FirebaseException catch (e) {
      final message = _createErrorMessage(e);
      emit(state.copyWith(
        status: LoginUserStatus.failure,
        error: message,
      ));
    }
  }

  String _createErrorMessage(FirebaseException e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    } else {
      return e.message ?? 'An unknown error occurred.';
    }
  }
}
