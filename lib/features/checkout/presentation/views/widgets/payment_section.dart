import 'package:e_commerce_app/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 24,
        ),
        OrderSummaryWidget(),
      ],
    );
  }
}
