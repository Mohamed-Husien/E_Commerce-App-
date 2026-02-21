import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "صباح الخير !..",
        style: TextStyles.regular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: Text("أحمد مصطفي",
          style: TextStyles.bold16.copyWith(
            color: const Color(0xff0C0D0D),
          )),
      leading: Image.asset(Assets.imagesProfileImage),
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(
          Assets.imagesNotification,
        ),
      ),
    );
  }
}
