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
}
