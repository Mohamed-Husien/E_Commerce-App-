import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/validator_class.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_don_not_have_account_widget.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_or_widget.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String passWord, email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                validator: (value) => Validators.email(value),
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  passWord = value!;
                },
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context
                        .read<SignInCubit>()
                        .signInWithEmailAndPassword(email, passWord);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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
                onPressed: () async {
                  await context.read<SignInCubit>().signInWithGoogle();
                },
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
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
                image: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
