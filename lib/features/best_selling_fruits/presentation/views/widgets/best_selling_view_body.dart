import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/get_dummy_products.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "الأكثر مبيعًا",
              style: TextStyles.bold16,
            ),
            GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 170 / 230,
                ),
                itemBuilder: (context, index) {
                  return FruitItem(product: getDummyProduct());
                }),
          ],
        ),
      ),
    );
  }
}
