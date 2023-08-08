import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../enums.dart';
import '../repositories/authentication_repository.dart';
import '../widgets/user_form.dart';
import 'bloc/register_user_bloc.dart';
import 'bloc/register_user_event.dart';
import 'bloc/register_user_state.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterUserBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: BlocConsumer<RegisterUserBloc, RegisterUserState>(
        listener: (context, state) {
          if (state.status == UserFormStatus.success) {
            context.read<UserBloc>().add(const InitializeUserState());
          }
        },
        builder: (context, state) {
          void onSubmit(String email, String password) =>
              context.read<RegisterUserBloc>().add(RegisterUser(
                    email: email,
                    password: password,
                  ));

          return UserForm(
            onSubmit: onSubmit,
            title: 'Register user',
            status: state.status,
            error: state.error,
          );
        },
      ),
    );
  }
}
