import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/features/authentication/auth.dart';
import 'package:induction_app/utils/strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.9),
                      Colors.black,
                    ],
                    stops: const [0, 0.67, 0.72, 0.85, 1],
                  ).createShader(rect);
                },
                child: Container(
                  child: Image.asset(
                    MediaStrings.cegPic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                width: 55.0,
                top: 25.0,
                right: 25.0,
                child: SafeArea(
                    child: Image.asset(
                  MediaStrings.ctf,
                  color: Colors.white,
                ))),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 20.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.075),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ready to Explore?",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 25.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Discover, connect, and thrive into\n campus life.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.65),
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    IButton(
                      text: "Gets Started",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthScreen()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
