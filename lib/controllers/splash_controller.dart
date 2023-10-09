import 'package:get/get.dart';
import 'package:nature_photos/bindings/sign_up_or_sign_in_binding.dart';
import 'package:nature_photos/bindings/start_binding.dart';
import 'package:nature_photos/screens/sign_up_or_sign_in_screen.dart';
import 'package:nature_photos/screens/start_screen.dart';

class SplashController extends GetxController {
  void start() {
    Get.to(() => const StartScreen(), binding: StartBinding());
  }

  void login() {
    Get.to(() => const SignUpOrSignInScreen(),
        binding: SignUpOrSignInBinding());
  }
}
