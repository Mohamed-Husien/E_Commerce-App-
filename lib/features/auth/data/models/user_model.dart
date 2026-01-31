import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});
  factory UserModel.fromUserModel(user) {
    return UserModel(
      name: user.displayName ?? 'Unknown',
      email: user.email ?? 'Unknown',
      uId: user.uid,
    );
  }
}
