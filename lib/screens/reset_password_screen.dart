import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});
  Future<void> resetPassword() async => await controller.resetPassword();
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
