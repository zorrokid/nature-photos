import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/bloc/user/user_event.dart';
import 'package:nature_photos/bloc/user/user_state.dart';
import 'package:nature_photos/bloc/user/user_status.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.authenticationRepository})
      : super(const UserState()) {
    on<InitializeUserState>(_onInitializeUserState);
  }

  final AuthenticationRepository authenticationRepository;

  FutureOr<void> _onInitializeUserState(
      InitializeUserState event, Emitter<UserState> emit) {
    if (authenticationRepository.isUserLoggedIn()) {
      emit(state.copyWith(
        status: UserStatus.loggedIn,
      ));
    } else {
      emit(state.copyWith(
        status: UserStatus.loggedOut,
      ));
    }
    /*FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _updateUser(user, emit);
    });

    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      _updateUser(user, emit);
    });

    FirebaseAuth.instance.userChanges().listen((User? user) {
      _updateUser(user, emit);
    });*/
  }

  /*void _updateUser(User? user, Emitter<UserState> emit) {
    if (user == null) {
      // TODO: nämä emitit ei toimi! user pitää tallentaa jotenkin muuten
      emit(state.copyWith(
        status: UserStatus.loggedOut,
        user: null,
      ));
    } else {
      // TODO: nämä emitit ei toimi! user pitää tallentaa jotenkin muuten
      emit(state.copyWith(
        status: UserStatus.loggedIn,
        user: user,
      ));
    }
  }*/
}
