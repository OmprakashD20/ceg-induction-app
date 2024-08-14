import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:induction_app/features/onboarding/onboarding.dart';
import 'package:induction_app/utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Induction App',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          fontFamily: 'Poppins',
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: IColors.primary, selectionColor: IColors.primary)),
      home: OnBoardingScreen(),
    );
  }
}
