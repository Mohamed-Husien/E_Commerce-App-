import 'dart:developer';

import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");

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
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException('حدث خطأ غير متوقع.');
    }
  }
// Sign In Method

  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      switch (e.code) {
        case 'user-not-found':
          throw CustomException('المستخدم غير موجود.');

        case 'wrong-password':
          throw CustomException('كلمة المرور او البريد الإلكتروني غير صحيح.');

        case 'invalid-email':
          throw CustomException(' البريد الإلكتروني غير صالح.');

        case 'user-disabled':
          throw CustomException('تم تعطيل المستخدم.');

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
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      throw CustomException('حدث خطأ غير متوقع.');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
