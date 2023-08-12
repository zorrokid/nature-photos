import 'package:equatable/equatable.dart';
import 'package:nature_photos/bloc/user/auth_status.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.success,
    this.error,
  });
  final AuthStatus status;
  final String? error;

  AuthState copyWith({
    AuthStatus? status,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
