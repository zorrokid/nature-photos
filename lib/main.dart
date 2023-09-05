import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/repositories/config_repository.dart';
import 'package:nature_photos/screens/sign_up_or_sign_in_screen.dart';
import 'package:nature_photos/screens/splash_screen.dart';
import 'package:nature_photos/screens/start_screen.dart';

import 'bindings/start_binding.dart';
import 'controllers/user_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(UserController());
  });

  await ConfigRepository().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return GetMaterialApp(
      initialBinding: StartBinding(),
      title: 'Nature photos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(
        () => userController.initializing.value
            ? const SplashScreen()
            : userController.firebaseUser.value == null
                ? const SignUpOrSignInScreen()
                : const StartScreen(),
      ),
    );
  }
}
