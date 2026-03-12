import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/cubits/proucts_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/widgets/search_text_field.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  initState() {
    context.read<ProductsCubit>().getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: CustomHomeAppBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: SearchTextField()),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
                child: ProductsSectionHeader(
              productsCount: context.read<ProductsCubit>().productLength,
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const ProductGridViewBlocBuilder(),
          ],
        ));
  }
}
