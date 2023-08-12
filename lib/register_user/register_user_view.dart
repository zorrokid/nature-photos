import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/register_user/register_user_controller.dart';

import '../enums.dart';

//class RegisterUserView extends GetView {
class RegisterUserView extends StatelessWidget {
  RegisterUserView({super.key});
  //final registerUserControlelr = Get.find<RegisterUserController>();
  final registerUserController = Get.put(RegisterUserController());
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
