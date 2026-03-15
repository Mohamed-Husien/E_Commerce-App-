import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

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
      const Center(
        child: Text("الشحن"),
      ),
      const Center(
        child: Text("العنوان"),
      ),
      const Center(
        child: Text("الدفع"),
      ),
      const Center(
        child: Text("المراجعه"),
      ),
    ];
  }
}
