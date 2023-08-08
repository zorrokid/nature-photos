import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/bloc/user/user_event.dart';

import '../bloc/user/user_bloc.dart';
import '../enums.dart';
import '../repositories/authentication_repository.dart';
import '../widgets/user_form.dart';
import 'bloc/login_user_bloc.dart';
import 'bloc/login_user_event.dart';
import 'bloc/login_user_state.dart';

class LogInUserPage extends StatelessWidget {
  const LogInUserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogInUserBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: BlocConsumer<LogInUserBloc, LogInUserState>(
        listener: (context, state) {
          if (state.status == UserFormStatus.success) {
            context.read<UserBloc>().add(const InitializeUserState());
          }
        },
        builder: (context, state) {
          void onSubmit(String email, String password) =>
              context.read<LogInUserBloc>().add(LogInUser(
                    email: email,
                    password: password,
                  ));

          return UserForm(
            onSubmit: onSubmit,
            title: 'Log In',
            status: state.status,
            error: state.error,
          );
        },
      ),
    );
  }
}
