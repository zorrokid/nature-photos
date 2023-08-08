import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nature_photos/register_user/bloc/register_user_status.dart';

class RegisterUserState extends Equatable {
  const RegisterUserState({
    this.email = '',
    this.password = '',
    this.status = RegisterUserStatus.initial,
    this.userCredential,
    this.error,
  });

  final String email;
  final String password;
  final RegisterUserStatus status;
  final UserCredential? userCredential;
  final String? error;

  RegisterUserState copyWith({
    String? email,
    String? password,
    RegisterUserStatus? status,
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
