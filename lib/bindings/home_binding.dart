import 'package:get/get.dart';
import 'package:nature_photos/controllers/logout_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogOutController>(() => LogOutController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
