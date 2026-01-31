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
          throw CustomException('كلمة المرور ضعيفة جداً.');

        case 'email-already-in-use':
          throw CustomException('البريد الإلكتروني مستخدم بالفعل.');

        case 'invalid-email':
          throw CustomException(' البريد الإلكتروني غير صالح.');

        case 'operation-not-allowed':
          throw CustomException(' عملية غير مسموح بها.');

        case 'network-request-failed':
          throw CustomException(' لا يوجد اتصال بالإنترنت.');

        case 'too-many-requests':
          throw CustomException('عدد كبير من المحاولات. حاول مرة أخرى لاحقاً.');

        case 'internal-error':
          throw CustomException('حدث خطأ داخلي. حاول مرة أخرى.');

        default:
          throw CustomException('حدث خطأ غير متوقع.');
      }
    } catch (_) {
      throw CustomException('حدث خطأ غير متوقع.');
    }
  }
}
