import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/reset_password_binding.dart';
import 'package:nature_photos/controllers/logout_controller.dart';
import 'package:nature_photos/controllers/user_controller.dart';

import 'reset_password_screen.dart';

class ViewAccountScreen extends GetView<UserController> {
  ViewAccountScreen({super.key});

  final LogOutController logOutController = Get.put(LogOutController());

  void _navigateToResetPassword() => Get.to(
        () => const ResetPasswordScreen(),
        binding: ResetPasswordBinding(),
      );

  void _logOut() => logOutController.logOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Account'),
      ),
      body: controller.firebaseUser.value == null
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
                      Obx(
                        () => Text(controller.firebaseUser.value?.email ?? ''),
                      ),
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
