import 'package:get/get.dart';
import 'package:nature_photos/controllers/register_user_controller.dart';

import '../repositories/authentication_repository.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUserController>(() => RegisterUserController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
