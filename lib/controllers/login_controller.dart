import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

      // TODO: should this be controlled rather by LoginController lifecycle?
      email.value = "";
      password.value = "";
      error.value = "";

      Get.to(() => const StartScreen());
    } on AuthFailure catch (e) {
      error.value = e.message;
      status.value = UserFormStatus.failure;
    }
  }
}
