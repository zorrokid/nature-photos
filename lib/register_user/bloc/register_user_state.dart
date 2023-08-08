import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../enums.dart';

class RegisterUserState extends Equatable {
  const RegisterUserState({
    this.email = '',
    this.password = '',
    this.status = UserFormStatus.initial,
    this.userCredential,
    this.error,
  });

  final String email;
  final String password;
  final UserFormStatus status;
  final UserCredential? userCredential;
  final String? error;

  RegisterUserState copyWith({
    String? email,
    String? password,
    UserFormStatus? status,
    UserCredential? userCredential,
    String? error,
  }) {
    return RegisterUserState(
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
