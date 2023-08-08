import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/authentication_repository.dart';
import 'bloc/register_user_bloc.dart';
import 'bloc/register_user_event.dart';
import 'bloc/register_user_state.dart';
import 'bloc/register_user_status.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterUserBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: RegisterUserForm(),
    );
  }
}

class RegisterUserForm extends StatelessWidget {
  RegisterUserForm({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Widget _createContentByState(RegisterUserState state) {
    switch (state.status) {
      case RegisterUserStatus.submitting:
        return const Center(child: CircularProgressIndicator());
      case RegisterUserStatus.success:
        return const Center(child: Text('Success'));
      default:
        return Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: _emailController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: _passwordController,
            ),
            state.status == RegisterUserStatus.failure && state.error != null
                ? Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink(),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Register user'),
        ),
        body: _createContentByState(state),
        floatingActionButton: state.status == RegisterUserStatus.submitting
            ? null
            : FloatingActionButton(
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) return;
                  context.read<RegisterUserBloc>().add(RegisterUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                },
                child: const Icon(Icons.check),
              ),
      );
    });
  }
}
