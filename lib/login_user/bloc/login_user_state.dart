import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_user_status.dart';

class LoginUserState extends Equatable {
  const LoginUserState({
    this.email = '',
    this.password = '',
    this.status = LoginUserStatus.initial,
    this.userCredential,
    this.error,
  });

  final String email;
  final String password;
  final LoginUserStatus status;
  final UserCredential? userCredential;
  final String? error;

  LoginUserState copyWith({
    String? email,
    String? password,
    LoginUserStatus? status,
    UserCredential? userCredential,
    String? error,
  }) {
    return LoginUserState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      userCredential: userCredential ?? this.userCredential,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        userCredential,
        error,
      ];
}
