import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {}
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(context, title: "حساب جديد"),
          body: ModalProgressHUD(
              inAsyncCall: state is SignUpLoading ? true : false,
              child: const SignUpViewBody()),
        );
      },
    );
  }
}
