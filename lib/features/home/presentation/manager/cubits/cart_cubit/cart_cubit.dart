import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity productEntity) {
    var cartItem = cartEntity.getItem(productEntity);
    bool isProductExist = cartEntity.isExist(productEntity);
    if (isProductExist) {
      cartItem.increaseQuantity();
    } else {
      cartEntity.addItem(cartItem);
    }
    emit(CartInitial());
    emit(CartProductAdded());
  }
}
