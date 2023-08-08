import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_photos/bloc/user/user_bloc.dart';
import 'package:nature_photos/bloc/user/user_status.dart';

import '../add_photo/add_photo_page.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';
import '../register_user/register_user_page.dart';
import '../login_user/login_user_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void _addPhoto(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const AddPhotoPage(),
        ),
      );

  void _navigateToLogIn(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const LogInUserPage(),
        ),
      );

  void _logOut(BuildContext context) =>
      context.read<UserBloc>().add(const LogOutUser());

  void _navigateToRegister(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const RegisterUserPage(),
        ),
      );

  Widget _buildLoggedOut(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Nature photos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to nature photos!',
            ),
            TextButton(
              onPressed: () => _navigateToLogIn(context),
              child: const Text('Log in'),
            ),
            TextButton(
              onPressed: () => _navigateToRegister(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggedIn(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Nature photos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Wellcome to nature photos!',
            ),
            TextButton(
              onPressed: () => _logOut(context),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPhoto(context),
        tooltip: 'Add photo',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state.status == UserStatus.loggedOut) {
        return _buildLoggedOut(context);
      } else {
        return _buildLoggedIn(context);
      }
    });
  }
}
