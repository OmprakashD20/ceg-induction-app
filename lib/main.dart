import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/onboarding/onboarding.dart';
import 'package:induction_app/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/connectivity/connectivity_bloc.dart';

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
          cursorColor: IColors.primary,
          selectionColor: IColors.primary,
        ),
      ),
      home: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              if (state is ConnectivityInitial) {
                return const Text('Checking connectivity...');
              } else if (state is ConnectivitySuccess) {
                return const OnBoardingScreen();
              } else if (state is ConnectivityFailure) {
                return const Text('Not Connected');
              }
              return Container();
            },
          ),
    );
  }
}
