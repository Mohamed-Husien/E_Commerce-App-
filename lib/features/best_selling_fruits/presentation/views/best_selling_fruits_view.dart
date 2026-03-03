import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = "bestSellingFruitsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const BestSellingViewBody(),
    );
  }
}
