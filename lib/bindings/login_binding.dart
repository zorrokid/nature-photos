import 'package:get/get.dart';
import 'package:nature_photos/controllers/login_controller.dart';

import '../repositories/authentication_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
