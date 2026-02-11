import 'package:e_commerce_app/core/services/fire_base_auth_service.dart';
import 'package:e_commerce_app/core/services/firestore_service.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerLazySingleton<FireBaseAuthService>(
    () => FireBaseAuthService(),
  );
  getIt.registerLazySingleton<FirestoreService>(
    () => FirestoreService(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
      fireStoreService: getIt<FirestoreService>(),
    ),
  );
}
