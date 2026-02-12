import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/fire_base_auth_service.dart';
import 'package:e_commerce_app/core/services/firestore_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final FirestoreService fireStoreService;

  AuthRepoImpl(
      {required this.fireStoreService, required this.fireBaseAuthService});
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
      return right(UserModel.fromUserModel(user));
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
      await addUserData(user: userEntity);
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
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await fireBaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromUserModel(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("Exception in signInWithFacebook AuthRepoImpl: $e");
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await fireStoreService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthService.deleteUser();
    }
  }
}
