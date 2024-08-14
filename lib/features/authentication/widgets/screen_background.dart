import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class ScreenBackground extends StatelessWidget {
  ScreenBackground({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(MediaStrings.screen),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: SizedBox(),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: IDeviceUtils.getStatusBarHeight(context)),
          child: SizedBox(
            height: IDeviceUtils.getScreenHeight(context),
            child: child,
          ),
        )
      ],
    );
  }
}
