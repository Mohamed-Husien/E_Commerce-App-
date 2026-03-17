import 'package:e_commerce_app/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_address_widget.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const OrderSummaryWidget(),
        const SizedBox(
          height: 16,
        ),
        ShippingAddressWidget(
          pageController: pageController,
        ),
      ],
    );
  }
}
