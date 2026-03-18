import 'dart:developer';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/core/utils/app_keys.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/cubits/add_order/add_order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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

  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderInputEntity>();
                if (orderEntity.payWithCash != null) {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showBar(context, 'يرجي تحديد طريقه الدفع');
                }
              } else {
                handleAddressingSectionValidation(context);
              }
            },
            pageController: _pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
                valueListenable: valueNotifier,
                formKey: _formKey,
                pageController: _pageController),
          ),
          CustomButton(
              onPressed: () {
                if (currentPageIndex == 0) {
                  handleShippingSectionValidation(context);
                } else if (currentPageIndex == 1) {
                  handleAddressingSectionValidation(context);
                } else {
                  _processPayment(context);
                }
              },
              text: getNextButtonText(currentPageIndex,
                  orderEntity: orderEntity)),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
      _pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      showBar(context, "قم باختيار طريقة الدفع");
    }
  }

  String getNextButtonText(int currentPageIndex,
      {required OrderInputEntity orderEntity}) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';

      case 2:
        return orderEntity.payWithCash!
            ? 'تأكيد والدفع كاش'
            : 'الدفع بواسطة PayPal';
      default:
        return 'التالي';
    }
  }

  void handleAddressingSectionValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPayPalClienId,
        secretKey: kPayPalSecretKey,
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderCubit.addOrder(orderEntity: orderEntity);

          showBar(context, 'تمت العملية بنجاح');
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          showBar(context, 'حدث خطأ في عملية الدفع');
          addOrderCubit.addOrder(orderEntity: orderEntity);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
