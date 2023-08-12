import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
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
          onPressed: () {},
          child: const Icon(Icons.send),
        ));
  }
}
