import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/ctf_box.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/help/widgets/contact_card.dart';
import 'package:induction_app/models/contact_model.dart';
import 'package:induction_app/utils/color.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const ScreenAppBar(
              text: "Developers",
              automaticallyImplyLeading: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "For any feedback or to report bugs in the app, please feel free to contact us.",
                style: TextStyle(fontSize: 15.0, color: IColors.darkerGrey),
              ),
            ),
            ContatctCard(
              contacts: ContactModel.helpDevs,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: CTFBox(),
            )
          ],
        )),
      ),
    );
  }
}
