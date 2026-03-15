import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CheckoutSteps(),
        ],
      ),
    );
  }
}
