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
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? 'Unknown',
      email: map['email'] ?? 'Unknown',
      uId: map['uId'] ?? 'Unknown',
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uId: userEntity.uId,
    );
  }
  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
