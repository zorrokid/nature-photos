import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_account_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class ViewAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAccountController>(() => ViewAccountController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
