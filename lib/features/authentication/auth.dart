import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induction_app/features/authentication/widgets/auth_form.dart';
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
                  SizedBox(
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
