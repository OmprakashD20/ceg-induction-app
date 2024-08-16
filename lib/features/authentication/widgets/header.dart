import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

List<Widget> authHeader() {
  return [
    ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) {
          return const LinearGradient(colors: [
            Color.fromARGB(255, 15, 42, 148),
            IColors.darkBlue,
            Color.fromARGB(255, 216, 243, 252),
          ], stops: [
            0,
            0.3,
            1
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
        },
        child: const Text(
          "\"Hola\n CEGians\"",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w800,
            fontFamily: "Poppins",
            height: 1.2,
          ),
        )),
    const SizedBox(
      height: 10.0,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Text(
        "LogIn with your credentials.",
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.black.withOpacity(0.85),
            fontWeight: FontWeight.w500),
      ),
    ),
  ];
}
