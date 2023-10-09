import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/reset_password_binding.dart';
import 'package:nature_photos/controllers/app_controller.dart';
import 'package:nature_photos/controllers/user_controller.dart';

import 'reset_password_screen.dart';

class ViewAccountScreen extends GetView<AppController> {
  ViewAccountScreen({super.key});

  final UserController userController = Get.find<UserController>();

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
      body: userController.firebaseUser.value == null
          ? const Center(
              child: Text('Not logged in'),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      const Text('Logged in as: '),
                      Obx(() =>
                          Text(userController.firebaseUser.value?.email ?? '')),
                    ],
                  ),
                ),
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
