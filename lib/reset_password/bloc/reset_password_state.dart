import 'package:equatable/equatable.dart';

enum ResetPasswordStatus {
  initial,
  processing,
  done,
  failure,
}

class ResetPasswordState extends Equatable {
  const ResetPasswordState({this.status = ResetPasswordStatus.initial});
  final ResetPasswordStatus status;

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
  }) =>
      ResetPasswordState(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}
