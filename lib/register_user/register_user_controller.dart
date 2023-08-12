import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nature_photos/enums.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class RegisterUserController extends GetxController {
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
      await repository.registerUser(
          email: emailController.value.text,
          password: emailController.value.text);
      Get.snackbar(
        "User registration",
        "User registered",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on AuthFailure catch (e) {
      error.value = e.message;
      status.value = UserFormStatus.failure;
    }
  }
}
