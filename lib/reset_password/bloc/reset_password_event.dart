import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

class ResetPassword extends ResetPasswordEvent {
  final String email;

  const ResetPassword({required this.email});

  @override
  List<Object> get props => [email];
}
