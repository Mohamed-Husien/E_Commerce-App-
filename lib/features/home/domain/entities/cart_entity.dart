import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void removeItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getItem(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  double calcTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calcTotalPrice();
    }
    return totalPrice;
  }
}
