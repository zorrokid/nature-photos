import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/start_binding.dart';

import '../screens/start_screen.dart';

class AuthFailure implements Exception {
  const AuthFailure({
    required this.message,
  });

  final String message;

  AuthFailure.fromCode(String code) : message = _createErrorMessage(code);

  static String _createErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'user-not-found':
        return 'The account does not exist for that email.';
      default:
        return 'An unknown error occurred.';
    }
  }
}

class AuthenticationRepository {
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromCode(e.code);
    } on Exception catch (_) {
      throw const AuthFailure(
        message: 'An unknown error occurred.',
      );
    }
  }

  Future<User> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromCode(e.code);
    } on Exception catch (_) {
      throw const AuthFailure(
        message: 'An unknown error occurred.',
      );
    }
  }

  bool isUserLoggedIn() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  Future<void> logOutUser() async => await FirebaseAuth.instance.signOut();

  /*
Are these needed?
auth/missing-continue-uri
  A continue URL must be provided in the request.
auth/invalid-continue-uri
  The continue URL provided in the request is invalid.
auth/unauthorized-continue-uri
  The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
*/
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Password reset",
        "Password reset email sent",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(() => const StartScreen(), binding: StartBinding());
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromCode(e.code);
    } on Exception catch (_) {
      throw const AuthFailure(
        message: 'An unknown error occurred.',
      );
    }
  }
}
