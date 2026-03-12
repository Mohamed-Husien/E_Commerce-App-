import 'dart:developer';

import 'package:e_commerce_app/core/cubits/proucts_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/helper_functions/get_dummy_products.dart';
import 'package:e_commerce_app/core/widgets/custom_error_widget.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellingGridView(
              products: getDummyProducts(),
            ),
          );
        } else if (state is ProductsSuccess) {
          log(state.products.toString());
          return BestSellingGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(message: state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
