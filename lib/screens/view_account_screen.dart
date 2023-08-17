import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/reset_password_binding.dart';
import 'package:nature_photos/controllers/view_account_controller.dart';

import 'reset_password_screen.dart';

class ViewAccountScreen extends GetView<ViewAccountController> {
  const ViewAccountScreen({super.key});

  void _navigateToResetPassword() => Get.to(
        () => const ResetPasswordScreen(),
        binding: ResetPasswordBinding(),
      );

  void _logOut() => controller.logOut();

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
