import 'package:equatable/equatable.dart';

abstract class LoginUserEvent extends Equatable {
  const LoginUserEvent();
}

class LogInUser extends LoginUserEvent {
  const LogInUser({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
