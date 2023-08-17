import 'package:get/get.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
