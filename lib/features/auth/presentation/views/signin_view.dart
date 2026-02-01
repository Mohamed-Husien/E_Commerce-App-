import 'package:e_commerce_app/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return const SignInViewBodyBlocConsumer();
  }
}
