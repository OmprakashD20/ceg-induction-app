import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/authentication/auth.dart';
import 'package:induction_app/features/ceg/navigation.dart';
import 'package:induction_app/features/onboarding/onboarding.dart';
import 'package:induction_app/repository/user_repository.dart';
import 'package:induction_app/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/connectivity/connectivity_bloc.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:induction_app/utils/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  //force the app to be in portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const InductionAppProviders());
  });
}

class InductionAppProviders extends StatelessWidget {
  const InductionAppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(create: (context) => ConnectivityBloc())
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  Future<Map<String, bool>> _checkPrefernces() async {
    final PreferenceManager prefs = await PreferenceManager.getInstance();
    final bool onBoarding =
        IHelpers.extractRightFromEither(prefs.getData<bool>("onBoarding"))!;
    final String rollNo =
        IHelpers.extractRightFromEither(prefs.getData<String>("rollNo"))!;

    return {
      "onBoarding": onBoarding,
      "rollNo": rollNo != "" ? true : false,
    };
  }

  void _fetchUser(BuildContext context) async {
    final PreferenceManager prefs = await PreferenceManager.getInstance();
    final String rollNo =
        IHelpers.extractRightFromEither(prefs.getData<String>("rollNo"))!;

    // ignore: use_build_context_synchronously
    context
        .read<UserBloc>()
        .add(FetchData(rollNo: rollNo, isInitialDataFetch: true));
  }

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
        home: OrientationBuilder(builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 450) {
            return const ILoaderScreen(
              content: Constants.noTabletLoader,
              height: 0.0,
              width: 0.0,
            );
          } else {
            return ConnectivityHandler(
              successWidget: FutureBuilder<Map<String, bool>>(
                future: _checkPrefernces(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ILoaderScreen(
                        content: Constants.loadingLoader);
                  } else if (snapshot.data!["onBoarding"] == false) {
                    return const OnBoardingScreen();
                  } else if (snapshot.data!["onBoarding"] == true &&
                      snapshot.data!["rollNo"] == false) {
                    return const AuthScreen();
                  } else if (snapshot.data!["rollNo"] == true) {
                    _fetchUser(context);
                    return const NavigationMenuBar();
                  } else if (snapshot.hasError) {
                    return const ILoaderScreen(
                        content: Constants.error404Loader);
                  }
                  return Container();
                },
              ),
            );
          }
        }));
  }
}
