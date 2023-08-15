import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../enums.dart';
import '../controllers/login_controller.dart';

class LogInUserScreen extends StatelessWidget {
  LogInUserScreen({super.key});
  final registerUserController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in user'),
      ),
      body: Obx(
        () => Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: registerUserController.emailController,
              validator: registerUserController.validator,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: registerUserController.passwordController,
              validator: registerUserController.validator,
            ),
            registerUserController.status.value == UserFormStatus.failure &&
                    registerUserController.error.isNotEmpty
                ? Text(
                    registerUserController.error.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: Obx(
          () => registerUserController.status.value == UserFormStatus.submitting
              ? Container()
              : FloatingActionButton(
                  onPressed: () => registerUserController.submitForm(),
                  child: const Icon(Icons.check),
                )),
    );
  }
}
