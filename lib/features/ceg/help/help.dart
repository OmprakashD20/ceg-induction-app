import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/help/widgets/contact_card.dart';
import 'package:induction_app/models/contact_model.dart';
import 'package:induction_app/utils/color.dart';

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "For any queries you can contact the CTF members.",
                style: TextStyle(fontSize: 15.0, color: IColors.darkerGrey),
              ),
            ),
            ContatctCard(
              contacts: ContactModel.helpContacts,
            )
          ],
        )),
      ),
    );
  }
}
