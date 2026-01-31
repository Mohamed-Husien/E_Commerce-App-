import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw CustomException('Password is too weak.');

        case 'email-already-in-use':
          throw CustomException('Email is already in use.');

        case 'invalid-email':
          throw CustomException('Invalid email address.');

        case 'operation-not-allowed':
          throw CustomException('Email/password sign-in is not enabled.');

        case 'network-request-failed':
          throw CustomException('No internet connection.');

        case 'too-many-requests':
          throw CustomException('Too many attempts. Try again later.');

        case 'internal-error':
          throw CustomException('Server error occurred. Please try again.');

        default:
          throw CustomException('Unexpected error occurred.');
      }
    } catch (_) {
      throw CustomException('Unexpected error occurred.');
    }
  }
}
