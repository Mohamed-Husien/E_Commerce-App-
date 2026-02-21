import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "الأكثر مبيعًا",
          style: TextStyles.bold16,
        ),
        Text(
          "المزيد",
          style: TextStyles.regular13.copyWith(
            color: const Color(
              0xff949D9E,
            ),
          ),
        )
      ],
    );
  }
}
