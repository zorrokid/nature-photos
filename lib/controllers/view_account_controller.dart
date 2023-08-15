import 'package:get/get.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class ViewAccountController extends GetxController {
  ViewAccountController();
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();
  Future<void> logOut() async {
    await _authenticationRepository.logOutUser();
  }
}
