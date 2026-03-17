import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_state.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showErrorBar(context, "تم اضافة المنتج بنجاح");
        }
        if (state is CartItemRemoved) {
          showErrorBar(context, "تم حذف المنتج بنجاح");
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
