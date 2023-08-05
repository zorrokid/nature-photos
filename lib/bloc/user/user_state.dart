import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nature_photos/bloc/user/user_status.dart';

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.loggedOut,
    this.user,
  });

  final UserStatus status;
  final User? user;

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}
