import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/circle_icon_button.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import "dart:math" as math;

class CEGMapScreen extends StatelessWidget {
  const CEGMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = IDeviceUtils.getScreenHeight(context);
    double width = IDeviceUtils.getScreenWidth(context);
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
          child: Column(
        children: [
          ScreenAppBar(text: "CEG Campus Map"),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: height * 0.1),
            decoration: BoxDecoration(
                color: IColors.lightBlue.withOpacity(0.75),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Image.asset(
                    MediaStrings.map,
                  ),
                ),
                IButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapFullScreen()));
                  },
                  text: "Full Screen",
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
            Container(
              //color: Colors.red,

              width: width,
              height: height,
              child: InteractiveViewer(
                constrained: true,
                //panEnabled: false,
                minScale: 1,
                maxScale: 5,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: Image.asset(
                    MediaStrings.map,
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

//  Padding(
//             padding: EdgeInsets.only(
//                 top: IDeviceUtils.getScreenHeight(context) * 0.1),
//             child: Container(
//               padding: EdgeInsets.all(10.0),
//               margin: EdgeInsets.symmetric(horizontal: 15.0),
//               decoration: BoxDecoration(
//                   color: IColors.lightBlue.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(
//                 children: [
//                   InstaImageViewer(
//                     disableSwipeToDismiss: true,
//                     backgroundColor: Colors.transparent,
//                     child: Image(
//                       width: IDeviceUtils.getScreenWidth(context),
//                       height: IDeviceUtils.getScreenWidth(context) * 0.65,
//                       // loadingBuilder: (context, child, loadingProgress) {
//                       //   return Center(
//                       //     child: CircularProgressIndicator(
//                       //       color: IColors.primary,
//                       //     ),
//                       //   );
//                       // },
//                       image: Image.asset(MediaStrings.map).image,
//                     ),
//                   ),
//                   Text("Tap to View Full Screen")
//                 ],
//               ),
//             ),
//           ),