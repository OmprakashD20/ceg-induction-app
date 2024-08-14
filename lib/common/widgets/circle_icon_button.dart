import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key,
      this.size = 35.0,
      this.borderColor = const Color.fromARGB(87, 255, 255, 255),
      this.margin = const EdgeInsets.symmetric(horizontal: 5.0),
      required this.icon,
      required this.onPressed,
      this.color = IColors.primary,
      this.borderRadius = 7.5});

  final double size;
  final double borderRadius;
  final IconData icon;
  final Color borderColor;
  final EdgeInsets margin;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: size,
          width: size,
          padding: EdgeInsets.all(5),
          margin: margin,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Center(
              child: Icon(
            icon,
            size: 20,
            color: IColors.white,
          ))),
    );
  }
}
