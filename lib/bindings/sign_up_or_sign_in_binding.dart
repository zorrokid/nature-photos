import 'package:get/get.dart';
import 'package:nature_photos/controllers/sign_up_or_sign_in_controller.dart';

class SignUpOrSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpOrSignInController());
  }
}
