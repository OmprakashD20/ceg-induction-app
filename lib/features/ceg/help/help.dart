import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            ScreenAppBar(
              text: "Help",
              automaticallyImplyLeading: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "For any queries you can contact the CTF members.",
                style: TextStyle(fontSize: 15.0, color: IColors.darkerGrey),
              ),
            ),
            // Container(
            //   width: IDeviceUtils.getScreenWidth(context) * 0.75,
            //   decoration: BoxDecoration(
            //       color: IColors.white,
            //       borderRadius: BorderRadius.circular(10.0)),
            //   padding: const EdgeInsets.all(10.0),
            //   child: Column(
            //     children: [],
            //   ),
            // )
          ],
        )),
      ),
    );
  }
}
