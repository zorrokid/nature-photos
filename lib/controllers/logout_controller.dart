import 'package:get/get.dart';
import 'package:nature_photos/bindings/sign_up_or_sign_in_binding.dart';
import 'package:nature_photos/controllers/app_controller.dart';
import 'package:nature_photos/controllers/login_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';
import 'package:nature_photos/screens/sign_up_or_sign_in_screen.dart';

class LogOutController extends GetxController {
  final authenticationRepository = Get.find<AuthenticationRepository>();

  Future<void> logOut() async {
    await authenticationRepository.logOutUser();
    Get.snackbar("Log out", "Logging user out");
    Get.delete<LoginController>();
    Get.delete<AppController>();
    Get.to(() => const SignUpOrSignInScreen(),
        binding: SignUpOrSignInBinding());
  }
}
