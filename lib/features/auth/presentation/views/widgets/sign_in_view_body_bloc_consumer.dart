import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "تسجيل دخول"),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.pushNamed(context, HomeView.routeName);
          }
          if (state is SignInFailure) {
            buildErrorBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
              isLoading: state is SignInLoading ? true : false,
              child: const SignInViewBody());
        },
      ),
    );
  }
}
