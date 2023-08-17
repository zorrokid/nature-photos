import 'package:get/get.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';

class LogOutController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();

  Future<void> logOut() async {
    await _authenticationRepository.logOutUser();
    Get.snackbar("Log out", "Logging user out");
  }
}
