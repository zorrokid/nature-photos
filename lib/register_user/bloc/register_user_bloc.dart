import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/register_user/bloc/register_user_event.dart';
import 'package:nature_photos/register_user/bloc/register_user_state.dart';
import 'package:nature_photos/register_user/bloc/register_user_status.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc({required this.authenticationRepository})
      : super(const RegisterUserState()) {
    on<RegisterUser>(_onRegisterUser);
  }
  final AuthenticationRepository authenticationRepository;

  Future<void> _onRegisterUser(
      RegisterUser event, Emitter<RegisterUserState> emit) async {
    emit(state.copyWith(
      email: event.email,
      password: event.password,
      status: RegisterUserStatus.submitting,
    ));

    try {
      final userCredential = await authenticationRepository.registerUser(
          email: event.email, password: event.password);

      emit(state.copyWith(
        status: RegisterUserStatus.success,
        userCredential: userCredential,
      ));
    } on RegisterUserFailure catch (e) {
      emit(state.copyWith(
        status: RegisterUserStatus.failure,
        error: e.message,
      ));
    }
  }
}
