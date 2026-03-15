import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {},
          isSelected: true,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: "40",
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
            onTap: () {},
            isSelected: false,
            title: 'الدفع اونلاين',
            subTitle: 'يرجي تحديد طريقه الدفع',
            price: "100"),
      ],
    );
  }
}
