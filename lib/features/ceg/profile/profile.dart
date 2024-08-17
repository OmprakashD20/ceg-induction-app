// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/authentication/auth.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_section.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:induction_app/utils/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.automaticallyImplyLeading = false});
  final bool automaticallyImplyLeading;

  void _onLogout(BuildContext context) async {
    final PreferenceManager prefs = await PreferenceManager.getInstance();
    await prefs.removeData("rollNo");

    ISnackBar.clearAllSnackBars();
    ISnackBar.customToast(
      type: SnackBarType.success,
      title: "Logout Successfull!",
      subTitle: "See you soon freshie😁",
    );
    BlocProvider.of<UserBloc>(context).add(UserLogout());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityHandler(successWidget: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const ILoaderScreen(
            content: Constants.loadingLoader,
          );
        }
        if (state is UserError) {
          return const ILoaderScreen(
            content: Constants.error404Loader,
          );
        }
        if (state is UserLoaded) {
          final user = state.user;
          return Scaffold(
            backgroundColor: IColors.lightestBlue,
            body: ScreenBackground(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ScreenAppBar(
                        text: "Profile",
                        automaticallyImplyLeading: automaticallyImplyLeading,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15.0),
                      //   child: CircleIconButton(
                      //     onPressed: () {},
                      //     color: Colors.lightBlue,
                      //     size: 40,
                      //     icon: Iconsax.logout,
                      //   ),
                      // ),
                    ],
                  ),
                  UserInfoSection(
                    user: user,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: IButton(
                      width: double.infinity,
                      onTap: () => _onLogout(context),
                      text: "Logout",
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    ));
  }
}
