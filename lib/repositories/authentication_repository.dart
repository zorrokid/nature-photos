import 'package:firebase_auth/firebase_auth.dart';

class RegisterUserFailure implements Exception {
  const RegisterUserFailure({
    required this.message,
  });

  final String message;

  RegisterUserFailure.fromCode(String code)
      : message = _createErrorMessage(code);

  static String _createErrorMessage(String code) {
    print(code);
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      default:
        return 'An unknown error occurred.';
    }
  }
}

class LogInFailure implements Exception {
  const LogInFailure({
    required this.message,
  });

  final String message;

  LogInFailure.fromCode(String code) : message = _createErrorMessage(code);

  static String _createErrorMessage(String code) {
    print(code);
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
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
    } on FirebaseException catch (e) {
      throw RegisterUserFailure.fromCode(e.code);
    } on Exception catch (_) {
      throw const RegisterUserFailure(
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
    } on FirebaseException catch (e) {
      throw LogInFailure.fromCode(e.code);
    } on Exception catch (_) {
      throw const LogInFailure(
        message: 'An unknown error occurred.',
      );
    }
  }

  bool isUserLoggedIn() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }
}
