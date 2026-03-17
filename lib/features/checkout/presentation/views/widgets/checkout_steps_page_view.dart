import 'package:e_commerce_app/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required PageController pageController,
    required this.formKey,
  }) : _pageController = pageController;

  final PageController _pageController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(
        formKey: formKey,
      ),
      const PaymentSection(),
    ];
  }
}
