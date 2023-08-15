import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/sign_up_or_sign_in_screen.dart';
import '../screens/start_screen.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  final auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SignUpOrSignInScreen());
    } else {
      Get.offAll(() => const StartScreen());
    }
  }
}
