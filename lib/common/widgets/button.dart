import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

class IButton extends StatelessWidget {
  const IButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.margin = 10.0,
    this.icon,
    this.height,
    this.width,
  });
  final String text;
  final VoidCallback onTap;
  final bool isSuffixIcon;
  final bool isPrefixIcon;
  final double? height;
  final double margin;
  final double? width;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50.0,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        margin: EdgeInsets.symmetric(vertical: margin),
        decoration: BoxDecoration(
            color: IColors.darkBlue, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isPrefixIcon)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  icon ?? Iconsax.arrow_circle_right5,
                  color: Colors.white,
                ),
              ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 17.0,
                fontFamily: "Poppins",
              ),
            ),
            if (isSuffixIcon)
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Icon(
                  icon ?? Iconsax.arrow_circle_right5,
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
    );
  }
}
