import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const ShapeDecoration(
        color: Color(0xffEEF8ED),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(
        Assets.imagesNotification,
      ),
    );
  }
}
