import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/sign_up_or_sign_in_controller.dart';

class SignUpOrSignInScreen extends GetView<SignUpOrSignInController> {
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
              onPressed: () => controller.logIn(),
              child: const Text('Log in'),
            ),
            TextButton(
              onPressed: () => controller.register(),
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () => controller.resetPassword(),
              child: const Text('Reset password'),
            )
          ],
        ),
      ),
    );
  }
}
