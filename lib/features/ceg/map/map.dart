import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/circle_icon_button.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';
import "dart:math" as math;

class CEGMapScreen extends StatelessWidget {
  const CEGMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = IDeviceUtils.getScreenHeight(context);
    IDeviceUtils.getScreenWidth(context);
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
          child: Column(
        children: [
          const ScreenAppBar(text: "CEG Campus Map"),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: height * 0.1),
            decoration: BoxDecoration(
                color: IColors.lightBlue.withOpacity(0.75),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                const FadeInImage(
                  placeholder: AssetImage(
                    Constants.loader,
                  ),
                  image: AssetImage(
                    Constants.map,
                  ),
                ),
                // Container(
                //   //color: Colors.red,
                //   child: Image.asset(
                //     Constants.map,
                //   ),
                // ),
                IButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapFullScreen()));
                  },
                  text: "Full Screen",
                  isPrefixIcon: true,
                  icon: Iconsax.maximize_21,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class MapFullScreen extends StatelessWidget {
  const MapFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = IDeviceUtils.getScreenHeight(context);
    double width = IDeviceUtils.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: InteractiveViewer(
                constrained: true,
                //panEnabled: false,
                minScale: 1,
                maxScale: 5,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: const FadeInImage(
                    placeholder: AssetImage(
                      Constants.loader,
                    ),
                    image: AssetImage(
                      Constants.map,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: CircleIconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                borderColor: Colors.transparent,
                icon: Iconsax.arrow_left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}