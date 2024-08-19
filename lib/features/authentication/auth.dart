import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';

import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/authentication/helpers.dart';
import 'package:induction_app/features/authentication/widgets/header.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/help/help.dart';
import 'package:induction_app/features/ceg/navigation.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/preference_manager.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  TextEditingController regNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void _onLogin() async {
    final PreferenceManager prefs = await PreferenceManager.getInstance();
    await prefs.setData<String>(regNoController.text, "rollNo");
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => const NavigationMenuBar(),
      ),
    );
    setState(() {
      isLoading = false;
    });
    ISnackBar.clearAllSnackBars();
    ISnackBar.customToast(
      type: SnackBarType.success,
      title: "Login Successfull!",
      subTitle:
          "Congrats, Freshie! 🎉 Your credentials are as solid as your first-year dreams. Dive in and start exploring.",
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HelpScreen();
        })),
        backgroundColor: IColors.darkBlue,
        child: const Icon(
          Iconsax.message_question,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            setState(() {
              isLoading = false;
            });
            ISnackBar.customToast(
              type: SnackBarType.error,
              title: "Error",
              subTitle: state.message,
            );
          }
        },
        child: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  ...authHeader(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Form(
                    key: authFormKey,
                    child: SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.85,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: regNoController,
                              // validator: (value) => TextFieldHelpers.validateRegNo(
                              //     context: context,
                              //     fieldName: "RegNo",
                              //     value: value),
                              cursorColor: IColors.primary,
                              keyboardType: TextInputType.number,
                              decoration: TextFieldHelpers.inputDecoration(
                                tfBorderRadius: 10.0,
                                prefixIcon: const Icon(Iconsax.profile_circle),
                                labelText: "Register number",
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.85,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              // validator: (value) =>
                              //     TextFieldHelpers.validatePassword(
                              //         context: context,
                              //         fieldName: "Password",
                              //         value: value),
                              keyboardType: TextInputType.number,
                              cursorColor: IColors.primary,
                              decoration: TextFieldHelpers.inputDecoration(
                                tfBorderRadius: 10.0,
                                labelText: "Password",
                                hintText: "Your DOB in DDMMYYYY format",
                                prefixIcon: const Icon(Iconsax.calendar_1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          IButton(
                            height: 55.0,
                            width: width * 0.85,
                            text: isLoading ? "Logging in..." : "Login",
                            onTap: () {
                              bool valid = TextFieldHelpers.validate(
                                context: context,
                                regNo: regNoController.text,
                                password: passwordController.text,
                              );
                              if (!valid) return;

                              IDeviceUtils.hideKeyboard(context);
                              setState(() {
                                isLoading = true;
                              });

                              context.read<UserBloc>().add(
                                    UserLogin(
                                      username: regNoController.text,
                                      password: passwordController.text,
                                      onLogin: _onLogin,
                                    ),
                                  );

                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const NavigationMenuBar(),
                              //   ),
                              // );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
