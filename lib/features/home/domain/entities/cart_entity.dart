import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
}
