import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class InitializeUserState extends UserEvent {
  const InitializeUserState();

  @override
  List<Object> get props => [];
}
