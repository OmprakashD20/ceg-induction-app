import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/connectivity/connectivity_bloc.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/repository/user_repository.dart';

import './features/onboarding/onboarding.dart';
import './utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //transparent status bar
      statusBarColor: Colors.transparent,
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
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            bloc: context.read<ConnectivityBloc>(),
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
