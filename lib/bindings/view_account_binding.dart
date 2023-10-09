import 'package:get/get.dart';
import 'package:nature_photos/controllers/user_controller.dart';

class ViewAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
