import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/repos/order_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImple implements OrdersRepo {
  final DataBaseService firestoreService;

  OrdersRepoImple({required this.firestoreService});
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity orderEntity}) async {
    try {
      await firestoreService.addData(
          path: BackendEndpoint.orders,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
