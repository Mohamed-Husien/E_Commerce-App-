import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomOrWidget extends StatelessWidget {
  const CustomOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          "أو",
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xff0C0D0D),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
      ],
    );
  }
}
