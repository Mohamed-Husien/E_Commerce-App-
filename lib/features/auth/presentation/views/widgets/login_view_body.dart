import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_don_not_have_account_widget.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_or_widget.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Color(0xffC9CECF),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {},
                text: "تسجيل دخول",
              ),
              const SizedBox(
                height: 33,
              ),
              const DonNotHaveAccount(),
              const SizedBox(
                height: 33,
              ),
              const CustomOrWidget(),
              const SizedBox(
                height: 21,
              ),
              SocialLoginButton(
                title: "تسجيل بواسطة جوجل",
                onPressed: () {},
                image: Assets.imagesGoogleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                title: "تسجيل بواسطة أبل",
                onPressed: () {},
                image: Assets.imagesApplIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                title: "تسجيل بواسطة فيسبوك",
                onPressed: () {},
                image: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
