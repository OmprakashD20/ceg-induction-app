import 'package:flutter/material.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:lottie/lottie.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.width = 50,
    this.isMale = true,
  });
  final bool isMale;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Lottie.asset(isMale ? MediaStrings.male : MediaStrings.female,
          animate: true, width: width, fit: BoxFit.cover),
    );
  }
}
