import 'package:flutter/material.dart';

void showBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 2),
    ),
  );
}
