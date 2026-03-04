import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preference_singlton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefes.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
