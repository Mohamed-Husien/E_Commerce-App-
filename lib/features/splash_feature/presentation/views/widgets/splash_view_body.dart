import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preference_singlton.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = Prefes.getBool(kIsOnBoardingViewSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isOnBoardingViewSeen) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
