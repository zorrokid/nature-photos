import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Center(
      child: Obx(() => userController.initializing.value == true
          ? const Text('Loading...')
          : const Text('Ready!')),
    );
  }
}
