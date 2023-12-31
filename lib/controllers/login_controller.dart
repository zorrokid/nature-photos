import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/start_binding.dart';
import 'package:nature_photos/screens/start_screen.dart';

import '../enums.dart';
import '../repositories/authentication_repository.dart';

class LoginController extends GetxController {
  final email = "".obs;
  final password = "".obs;
  final error = "".obs;
  final status = UserFormStatus.initial.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repository = Get.find<AuthenticationRepository>();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  void submitForm() async {
    try {
      await repository.logInUser(
          email: emailController.value.text,
          password: emailController.value.text);
      Get.snackbar(
        "User login",
        "User logged in",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.to(() => const StartScreen(), binding: StartBinding());
    } on AuthFailure catch (e) {
      error.value = e.message;
      status.value = UserFormStatus.failure;
    }
  }
}
