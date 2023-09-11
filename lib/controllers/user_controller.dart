import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/start_binding.dart';

import '../bindings/sign_up_binding.dart';
import '../screens/sign_up_or_sign_in_screen.dart';
import '../screens/start_screen.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  final auth = FirebaseAuth.instance;
  final initializing = true.obs;

  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    initializing.value = false;
  }

  _setInitialScreen(User? user) {
    // TODO: was trying to redirect before GetMaterialApp was initialized and caused exception
    /*if (user == null) {
      print('user is null, go to sign up or sign in');
      Get.offAll(const SignUpOrSignInScreen(), binding: SignUpBinding());
    } else {
      print('user is logged in, go to start screen');
      Get.offAll(const StartScreen(), binding: StartBinding());
    }*/
  }
}
