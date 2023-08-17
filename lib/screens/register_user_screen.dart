import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/register_user_controller.dart';

import '../enums.dart';

class RegisterUserScreen extends GetView<RegisterUserController> {
  const RegisterUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User'),
      ),
      body: Obx(
        () => Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: controller.emailController,
              validator: controller.validator,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: controller.passwordController,
              validator: controller.validator,
            ),
            controller.status.value == UserFormStatus.failure &&
                    controller.error.isNotEmpty
                ? Text(
                    controller.error.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton:
          Obx(() => controller.status.value == UserFormStatus.submitting
              ? Container()
              : FloatingActionButton(
                  onPressed: () => controller.submitForm(),
                  child: const Icon(Icons.check),
                )),
    );
  }
}
