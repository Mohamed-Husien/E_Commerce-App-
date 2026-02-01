import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(context, title: "تسجيل دخول"),
          body: const SignInViewBody(),
        );
      },
    );
  }
}
