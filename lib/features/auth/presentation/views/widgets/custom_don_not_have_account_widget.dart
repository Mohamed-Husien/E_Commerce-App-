import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DonNotHaveAccount extends StatelessWidget {
  const DonNotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "     لا تمتلك حساب؟ ",
        style: TextStyles.semiBold16.copyWith(
          color: const Color(0xff949D9E),
        ),
        children: [
          TextSpan(
            text: "قم بإنشاء حساب",
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.darkPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
