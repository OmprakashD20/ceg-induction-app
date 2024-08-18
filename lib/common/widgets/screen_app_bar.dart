import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/circle_icon_button.dart';

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({
    super.key,
    required this.text,
    this.automaticallyImplyLeading = false,
  });
  final String text;
  final bool automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (automaticallyImplyLeading)
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              borderColor: Colors.transparent,
              icon: Iconsax.arrow_left,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
