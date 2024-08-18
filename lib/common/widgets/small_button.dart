import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

class ISmallButton extends StatelessWidget {
  const ISmallButton({
    super.key,
    this.onTap,
    this.icon = Iconsax.arrow_right_3,
    this.size = 17.5,
    this.iconColor,
    this.buttonColor,
    this.padding = 5.0,
    this.isBlue = false,
  });
  final VoidCallback? onTap;
  final IconData icon;
  final double size;
  final double padding;
  final bool isBlue;
  final Color? iconColor;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: !(buttonColor == null)
                ? buttonColor
                : isBlue
                    ? IColors.primary
                    : IColors.lightBlue,
            shape: BoxShape.circle),
        child: Icon(
          icon,
          size: size,
          color: !(iconColor == null)
              ? iconColor
              : isBlue
                  ? IColors.white
                  : IColors.primary,
        ),
      ),
    );
  }
}
