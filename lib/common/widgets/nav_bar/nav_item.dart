import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.isSelected, required this.icon});
  final bool isSelected;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //ANIMATED LINE
          AnimatedContainer(
            margin: const EdgeInsets.only(bottom: 2),
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: isSelected ? 25 : 0,
            decoration: const BoxDecoration(
                color: IColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                )),
          ),
          //ICON
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(opacity: isSelected ? 1 : 0.5, child: Icon(icon)),
          ),
        ],
      ),
    );
  }
}
