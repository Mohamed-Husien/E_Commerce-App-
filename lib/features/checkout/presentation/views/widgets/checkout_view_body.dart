import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            pageController: _pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
                formKey: _formKey, pageController: _pageController),
          ),
          CustomButton(
              onPressed: () {
                if (context.read<OrderEntity>().payWithCash != null) {
                  _pageController.animateToPage(currentPageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showErrorBar(context, "قم باختيار طريقة الدفع");
                }
              },
              text: getNextButtonText(currentPageIndex)),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';

      case 2:
        return 'الدفع بواسطة PayPal';
      default:
        return 'التالي';
    }
  }
}
