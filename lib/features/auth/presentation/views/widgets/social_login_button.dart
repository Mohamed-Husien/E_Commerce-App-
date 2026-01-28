import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});
  final String image, title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Color(0xffDCDEDE),
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          horizontalTitleGap: 53,
          leading: SvgPicture.asset(
            image,
            height: 24,
            width: 24,
          ),
          title: Text(
            title,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff0C0D0D),
            ),
          ),
        ),
      ),
    );
  }
}
