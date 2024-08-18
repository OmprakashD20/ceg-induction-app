import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Constants.screen),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: const SizedBox(),
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
