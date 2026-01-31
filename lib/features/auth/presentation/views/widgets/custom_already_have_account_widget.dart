import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "تمتلك حساب بالفعل؟",
        style: TextStyles.semiBold16.copyWith(
          color: const Color(0xff949D9E),
        ),
        children: [
          TextSpan(
            text: "  تسجيل دخول",
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.darkPrimaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
