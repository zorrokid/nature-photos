import 'package:get/get.dart';
import 'package:nature_photos/repositories/database_repository.dart';

import '../controllers/start_controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(() => StartController());
    Get.lazyPut<DatabaseRepository>(() => DatabaseRepository());
  }
}
