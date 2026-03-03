import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/active_item.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/in-active_item.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isActive,
      required this.bottomNavigationBarEntity});
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
