import 'package:e_commerce_app/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
        totalPrice: orderEntity.cartEntity.calcTotalPrice(),
        uID: orderEntity.uID,
        shippingAddressModel:
            ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
        orderProducts: orderEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(e))
            .toList(),
        paymentMethod: orderEntity.payWithCash! ? "cash" : "PayPal");
  }
  toJson() {
    return {
      "totalPrice": totalPrice,
      "uID": uID,
      "shippingAddressModel": shippingAddressModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod
    };
  }
}
