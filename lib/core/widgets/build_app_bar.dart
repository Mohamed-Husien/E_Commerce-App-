import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text(
      "الأكثر مبيعًا",
      style: TextStyles.bold19,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: NotificationWidget(),
      ),
    ],
  );
}
