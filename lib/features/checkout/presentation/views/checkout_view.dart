import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckoutViewBody(),
    );
  }
}
