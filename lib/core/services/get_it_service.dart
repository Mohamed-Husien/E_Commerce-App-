import 'package:e_commerce_app/core/repos/order_repo/orders_repo.dart';
import 'package:e_commerce_app/core/repos/order_repo/orders_repo_imple.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo_imple.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';
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
  getIt.registerLazySingleton<DataBaseService>(
    () => FirestoreService(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
      databaseService: getIt<DataBaseService>(),
    ),
  );

  getIt.registerLazySingleton<ProductRepo>(
    () => ProductsRepoImpl(
      getIt<DataBaseService>(),
    ),
  );
  getIt.registerLazySingleton<OrdersRepo>(
    () => OrdersRepoImple(
      firestoreService: getIt<DataBaseService>(),
    ),
  );
}
