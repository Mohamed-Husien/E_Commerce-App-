import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold16,
    ),
  );
}
