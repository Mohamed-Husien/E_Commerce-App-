import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity(
      {this.payWithCash,
      required this.shippingAddress,
      required this.cartEntity,
      required this.uID});
}
