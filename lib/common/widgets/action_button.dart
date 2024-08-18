import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.onTap, required this.iconImage});
  final VoidCallback? onTap;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: IColors.lightBlue.withOpacity(0.75)),
        child: Image.asset(
          iconImage,
          height: 35,
          width: 35.0,
        ),
      ),
    );
  }
}
