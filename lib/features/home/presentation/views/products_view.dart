import 'package:e_commerce_app/core/cubits/proucts_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(productRepo: getIt.get<ProductRepo>()),
      child: const ProductsViewBody(),
    );
  }
}
