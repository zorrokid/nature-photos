import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/login_controller.dart';

import '../enums.dart';

class LogInUserScreen extends GetView<LoginController> {
  const LogInUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in user'),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: controller.emailController,
                  validator: controller.validator,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: controller.passwordController,
                  validator: controller.validator,
                ),
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
