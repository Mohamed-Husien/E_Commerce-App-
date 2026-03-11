import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';

class ProductRepoImple extends ProductRepo {
  final DataBaseService dataBaseService;
  ProductRepoImple({required this.dataBaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseService.getData(path: "products", query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as Map<String, dynamic>;
      List<ProductModel> products =
          data.values.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEntity()).toList();
      return Right(productEntities);
    } catch (e) {
      return Left(ServerFailure("Faild to get products"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(path: "products")
          as Map<String, dynamic>;
      List<ProductModel> products =
          data.values.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEntity()).toList();
      return Right(productEntities);
    } catch (e) {
      return Left(ServerFailure("Faild to get products"));
    }
  }
}
