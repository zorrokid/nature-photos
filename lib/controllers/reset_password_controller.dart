import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';
import 'package:nature_photos/screens/sign_up_or_sign_in_screen.dart';

import '../enums.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController();
  final authenticationRepository = Get.find<AuthenticationRepository>();
  final email = "".obs;
  final error = "".obs;
  final status = UserFormStatus.initial.obs;
  final emailController = TextEditingController();

  Future<void> resetPassword() async {
    try {
      await authenticationRepository.resetPassword(email.value);
      Get.snackbar(
        "Reset password",
        "Password reset email sent",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(() => const SignUpOrSignInScreen());
    } on AuthFailure catch (e) {
      error.value = e.message;
      status.value = UserFormStatus.failure;
      Get.snackbar("Error", e.message);
    }
  }
}
