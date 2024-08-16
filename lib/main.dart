import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/onboarding/onboarding.dart';
import 'package:induction_app/splash.dart';
import 'package:induction_app/utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const App());
  });
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: ISnackBar.snackbarKey,
      debugShowCheckedModeBanner: false,
      title: 'Induction App',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          fontFamily: 'Poppins',
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: IColors.primary, selectionColor: IColors.primary)),
      home: const OnBoardingScreen(),
    );
  }
}
