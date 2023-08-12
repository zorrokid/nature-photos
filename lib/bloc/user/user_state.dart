import 'package:equatable/equatable.dart';
import 'package:nature_photos/bloc/user/user_status.dart';

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.loggedOut,
  });

  final UserStatus status;

  UserState copyWith({
    UserStatus? status,
  }) {
    return UserState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
