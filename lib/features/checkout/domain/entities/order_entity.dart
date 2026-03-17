import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress = ShippingAddressEntity();

  OrderEntity(
      {this.payWithCash, this.shippingAddress, required this.cartEntity});
}
