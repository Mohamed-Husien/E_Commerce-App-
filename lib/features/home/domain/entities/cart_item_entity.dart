import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({
    required this.productEntity,
    this.quantity = 0,
  });
  num calcTotalPrice() {
    return productEntity.price * quantity;
  }

  num calcTotalAmount() {
    return productEntity.unitAmount * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
