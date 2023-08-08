import 'package:equatable/equatable.dart';

import '../../enums.dart';

class LogInUserState extends Equatable {
  const LogInUserState({
    this.email = '',
    this.password = '',
    this.status = UserFormStatus.initial,
    this.error,
  });

  final String email;
  final String password;
  final UserFormStatus status;
  final String? error;

  LogInUserState copyWith({
    String? email,
    String? password,
    UserFormStatus? status,
    String? error,
  }) {
    return LogInUserState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        error,
      ];
}
