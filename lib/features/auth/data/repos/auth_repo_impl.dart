import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/fire_base_auth_service.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email, password);
      return right(UserModel.fromUserModel(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }
}
