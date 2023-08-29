import 'package:get/get.dart';
import 'package:nature_photos/controllers/logout_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

import '../controllers/start_controller.dart';
import '../repositories/database_repository.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogOutController>(() => LogOutController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<StartController>(() => StartController());
    Get.lazyPut<DatabaseRepository>(() => DatabaseRepository());
  }
}
