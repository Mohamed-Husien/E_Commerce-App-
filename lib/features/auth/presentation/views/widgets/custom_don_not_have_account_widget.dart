import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/gestures.dart';
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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                }),
        ],
      ),
    );
  }
}
