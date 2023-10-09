import 'package:get/get.dart';
import 'package:nature_photos/bindings/login_binding.dart';
import 'package:nature_photos/bindings/register_binding.dart';
import 'package:nature_photos/bindings/reset_password_binding.dart';
import 'package:nature_photos/screens/login_user_screen.dart';
import 'package:nature_photos/screens/register_user_screen.dart';
import 'package:nature_photos/screens/reset_password_screen.dart';

class SignUpOrSignInController extends GetxController {
  void logIn() {
    Get.to(() => const LogInUserScreen(), binding: LoginBinding());
  }

  void register() {
    Get.to(() => const RegisterUserScreen(), binding: RegisterBinding());
  }

  void resetPassword() {
    Get.to(() => const ResetPasswordScreen(), binding: ResetPasswordBinding());
  }
}
