import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 170 / 230,
        ),
        itemBuilder: (context, index) {
          return const FruitItem();
        });
  }
}
