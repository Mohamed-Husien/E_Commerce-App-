import 'package:e_commerce_app/core/cubits/proucts_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = "homeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProductsCubit(
            productRepo: getIt<ProductRepo>(),
          ),
          child: const HomeView(),
        ),
      ),
    );
  }
}
