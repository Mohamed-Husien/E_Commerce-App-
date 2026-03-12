import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepo}) : super(ProductsInitial());
  final ProductRepo productRepo;
  int productLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      productLength = products.length;

      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      productLength = products.length;

      emit(ProductsSuccess(products: products));
    });
  }
}
