import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:induction_app/features/onboarding/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
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
      theme: ThemeData(fontFamily: 'Poppins'),
      home: OnBoardingScreen(),
    );
  }
}
