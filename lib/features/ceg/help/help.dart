import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/ctf_box.dart';
import 'package:induction_app/common/widgets/link_card.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/strings.dart';

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
            const ScreenAppBar(
              text: "Help",
              automaticallyImplyLeading: true,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "In case of any technical difficulties leave us an email at.",
                    style: TextStyle(fontSize: 15.0, color: IColors.black),
                  ),
                  const SizedBox(height: 10.0),
                  LinkCard(
                    url: Constants.techopsEmail,
                    onTap: () async {
                      IHelpers.sendEmail(
                        email: Constants.techopsEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "For any other queries leave us an email at.",
                    style: TextStyle(fontSize: 15.0, color: IColors.black),
                  ),
                  const SizedBox(height: 10.0),
                  LinkCard(
                    url: Constants.hrEmail,
                    onTap: () async {
                      IHelpers.sendEmail(
                        email: Constants.hrEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 25.0),
                  const CTFBox(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
