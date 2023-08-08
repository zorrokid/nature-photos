import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/bloc/user/user_event.dart';
import 'package:nature_photos/bloc/user/user_state.dart';
import 'package:nature_photos/bloc/user/user_status.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<InitializeUserState>(_onInitializeUserState);
    on<LogOutUser>(_onLogOutUser);
  }

  FutureOr<void> _onInitializeUserState(
      InitializeUserState event, Emitter<UserState> emit) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _updateUser(user, emit);
    });

    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      _updateUser(user, emit);
    });

    FirebaseAuth.instance.userChanges().listen((User? user) {
      _updateUser(user, emit);
    });
  }

  void _updateUser(User? user, Emitter<UserState> emit) {
    if (user == null) {
      emit(state.copyWith(
        status: UserStatus.loggedOut,
        user: null,
      ));
    } else {
      emit(state.copyWith(
        status: UserStatus.loggedIn,
        user: user,
      ));
    }
  }

  Future<void> _onLogOutUser(LogOutUser event, Emitter<UserState> emit) async {
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(
      status: UserStatus.loggedOut,
      user: null,
    ));
  }
}
