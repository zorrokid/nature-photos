import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final resetPasswordController = Get.put(ResetPasswordController());
  Future<void> resetPassword() async =>
      await resetPasswordController.resetPassword();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Text(
              'Enter your email address and we will send you a link to reset your password.',
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: resetPassword,
          child: const Icon(Icons.send),
        ));
  }
}
