import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_item/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            isDisabled: context.read<CartCubit>().cartEntity.cartItems.isEmpty,
            onPressed: () {
              Navigator.pushNamed(context, CheckoutView.routeName);
            },
            text:
                " الدفع بقيمة ${context.watch<CartCubit>().cartEntity.calcTotalPrice()}");
      },
    );
  }
}
