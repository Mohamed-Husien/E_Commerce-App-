import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/core/utils/validator_class.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_already_have_account_widget.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String name, passWord, email;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  validator: (value) => Validators.name(value),
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
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
                TermsAndConditionsWidget(
                  onChanged: (value) => {
                    setState(() {
                      isTermsAccepted = value;
                    })
                  },
                ),
                const SizedBox(
                  height: 33,
                ),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassword(
                                email, passWord, name);
                      } else {
                        buildErrorBar(context, " يرجى قبول الشروط والأحكام ");
                      }
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "إنشاء حساب جديد",
                ),
                const SizedBox(
                  height: 26,
                ),
                const AlreadyHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
