import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/cubits/proucts_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/widgets/search_text_field.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomHomeAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: SearchTextField()),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: FeaturedList()),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: BestSellingHeader()),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            BestSellingGridView(),
          ],
        ));
  }
}
