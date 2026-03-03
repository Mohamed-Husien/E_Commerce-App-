import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      decoration: ShapeDecoration(
        color: const Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(Assets.imagesWatermelonTest),
                const SizedBox(height: 24),
                ListTile(
                  title: const Text(
                    "بطيخ",
                    style: TextStyles.semiBold13,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        "20جنية",
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.lightSecondaryColor),
                      ),
                      Text(
                        " / الكيلو",
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.lightSecondaryColor),
                      ),
                    ],
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.lightPrimaryColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
