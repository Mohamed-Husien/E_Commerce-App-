import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';
import 'package:e_commerce_app/core/services/fire_base_auth_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final DataBaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email, password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      log("Exception in createUserWithEmailAndPassword AuthRepoImpl: $e");
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }

//-------------------------------------------------------------------
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await fireBaseAuthService.signInWithEmailAndPassword(email, password);
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log("Exception in signInWithEmailAndPassword AuthRepoImpl: $e");
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }

//--------------------------------------------------------------------------------
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromUserModel(user);
      var isUserExists = await databaseService.checkIfDocumentExists(
          path: BackendEndpoint.isUserExists, documentId: user.uid);
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("Exception in signInWithGoogle AuthRepoImpl: $e");
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }

//--------------------------------------------------------------------------------
  @override
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await fireBaseAuthService.signInWithFacebook();

      final isUserExists = await databaseService.checkIfDocumentExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );

      if (isUserExists) {
        final userEntity = await getUserData(uId: user.uid);
        return right(userEntity);
      } else {
        final userEntity = UserModel.fromUserModel(user);
        await addUserData(user: userEntity);
        return right(userEntity);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return left(
          ServerFailure(
              'هذا الحساب مسجل باستخدام Google. الرجاء تسجيل الدخول بواسطة Google.'),
        );
      }

      return left(
        ServerFailure('خطأ في تسجيل الدخول بواسطة فيسبوك'),
      );
    } catch (e) {
      log("Exception in signInWithFacebook AuthRepoImpl: $e");
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uId);
    return UserModel.fromMap(userData);
  }
}
