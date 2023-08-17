import 'package:get/get.dart';
import 'package:nature_photos/controllers/reset_password_controller.dart';

import '../repositories/authentication_repository.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
