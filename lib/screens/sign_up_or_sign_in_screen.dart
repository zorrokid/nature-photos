import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_user_screen.dart';
import 'register_user_screen.dart';
import 'reset_password_screen.dart';

class SignUpOrSignInScreen extends StatelessWidget {
  const SignUpOrSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                Get.to(() => LogInUserScreen());
              },
              child: const Text('Log in'),
            ),
            TextButton(
              onPressed: () => Get.to(() => RegisterUserScreen()),
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () => Get.to(() => ResetPasswordScreen()),
              child: const Text('Reset password'),
            )
          ],
        ),
      ),
    );
  }
}
