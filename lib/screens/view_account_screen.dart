import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_account_controller.dart';

import 'reset_password_screen.dart';

class ViewAccountScreen extends StatelessWidget {
  ViewAccountScreen({super.key});

  final viewAccountController = Get.put(ViewAccountController());

  void _navigateToResetPassword() => Get.to(() => ResetPasswordScreen());

  void _logOut() => viewAccountController.logOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Account'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => _logOut(),
            child: const Text('Log out'),
          ),
          TextButton(
            onPressed: () => _navigateToResetPassword(),
            child: const Text('Reset password'),
          )
        ],
      ),
    );
  }
}
