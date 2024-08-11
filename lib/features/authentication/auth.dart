import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/features/authentication/helpers.dart';
import 'package:induction_app/features/authentication/widgets/auth_form.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    MediaStrings.blueBG,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: width,
                    child: Image.asset(
                      MediaStrings.blueBG2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SizedBox(),
            ),
          ),
          Positioned.fill(
            child: AuthForm(),
          )
        ],
      ),
    );
  }
}
