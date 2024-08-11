import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

class IButton extends StatelessWidget {
  IButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isSuffixIcon = true,
      this.height,
      this.width});
  final String text;
  VoidCallback onTap;
  bool isSuffixIcon;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50.0,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            color: IColors.darkBlue, borderRadius: BorderRadius.circular(7.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 17.0,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            if (isSuffixIcon)
              Icon(
                Iconsax.arrow_circle_right5,
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
