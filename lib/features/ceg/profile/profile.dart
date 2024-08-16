import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/action_button.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/faqs/faq.dart';
import 'package:induction_app/features/ceg/help/help.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_section.dart';
import 'package:induction_app/models/user_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, this.automaticallyImplyLeading = false});
  bool automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    const UserModel user = UserModel(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ActionButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FAQsScreen(),
                              ));
                        },
                        iconImage: MediaStrings.faqBox,
                      ),
                      ActionButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ));
                        },
                        iconImage: MediaStrings.helpBox,
                      ),
                    ],
                  ),
                )
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
            const UserInfoSection(
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
