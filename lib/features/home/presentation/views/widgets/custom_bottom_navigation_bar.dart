import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavigationBarItems.map(
          (e) {
            return NavigationBarItem(
              bottomNavigationBarEntity: e,
              isActive: false,
            );
          },
        ).toList(),
      ),
    );
  }
}
