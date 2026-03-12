import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addItem(CartItemEntity cartItemEntity) {
    cartEntity.addItem(cartItemEntity);
    emit(CartItemAdded());
  }
}
