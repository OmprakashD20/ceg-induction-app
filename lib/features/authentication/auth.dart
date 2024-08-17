import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induction_app/features/authentication/widgets/auth_form.dart';
import 'package:induction_app/utils/strings.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Constants.blueBG,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: width,
                  child: Image.asset(
                    Constants.blueBG2,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const Positioned.fill(
            child: AuthForm(),
          )
        ],
      ),
    );
  }
}
