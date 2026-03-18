import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final int quantity;
  final num price;
  final String code;
  final String imageUrl;

  OrderProductModel(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.code,
      required this.imageUrl});

  factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
        name: cartItemEntity.productEntity.name,
        quantity: cartItemEntity.quantity,
        price: cartItemEntity.productEntity.price,
        code: cartItemEntity.productEntity.code,
        imageUrl: cartItemEntity.productEntity.imageURL!);
  }
  toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'code': code,
      'imageUrl': imageUrl,
    };
  }
}
