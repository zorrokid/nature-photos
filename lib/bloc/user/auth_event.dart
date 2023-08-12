import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LogOutUser extends AuthEvent {
  const LogOutUser();

  @override
  List<Object> get props => [];
}
