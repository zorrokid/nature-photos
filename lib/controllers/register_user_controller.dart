import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nature_photos/enums.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

import '../bindings/start_binding.dart';
import '../screens/start_screen.dart';

class RegisterUserController extends GetxController {
  final email = "".obs;
  final password = "".obs;
  final error = "".obs;
  final status = UserFormStatus.initial.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  Future<void> submitForm() async {
    try {
      await _authenticationRepository.registerUser(
          email: emailController.value.text,
          password: emailController.value.text);
      Get.snackbar(
        "User registration",
        "User registered",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(() => const StartScreen(), binding: StartBinding());
    } on AuthFailure catch (e) {
      error.value = e.message;
      status.value = UserFormStatus.failure;
    }
  }
}
