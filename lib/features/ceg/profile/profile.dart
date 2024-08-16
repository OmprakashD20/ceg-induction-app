import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/circle_icon_button.dart';
import 'package:induction_app/common/widgets/profile_avatar.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_section.dart';
import 'package:induction_app/models/user_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, this.automaticallyImplyLeading = false});
  bool automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel(
      name: 'Tyler Durden',
      branch: 'BE',
      dept: 'Computer Science and Engineering',
      batchId: '2024',
      dob: '01-01-2000',
      rollNo: '123456',
      gender: 'Male',
    );

    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                ScreenAppBar(
                  text: "Profile",
                  automaticallyImplyLeading: automaticallyImplyLeading,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 15.0),
                //   child: CircleIconButton(
                //     onPressed: () {},
                //     color: Colors.lightBlue,
                //     size: 40,
                //     icon: Iconsax.logout,
                //   ),
                // ),
              ],
            ),
            UserInfoSection(
              user: user,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child:
                  IButton(width: double.infinity, onTap: () {}, text: "Logout"),
            )
          ],
        ),
      ),
    );
  }
}
