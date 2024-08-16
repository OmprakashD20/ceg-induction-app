import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/features/authentication/helpers.dart';
import 'package:induction_app/features/authentication/widgets/header.dart';
import 'package:induction_app/features/ceg/help/help.dart';
import 'package:induction_app/features/ceg/home/home.dart';
import 'package:induction_app/features/ceg/navigation.dart';
import 'package:induction_app/utils/color.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  TextEditingController regNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HelpScreen();
          })),
          backgroundColor: IColors.darkBlue,
          child: Icon(
            Iconsax.message_question,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                //Header
                ...authHeader(),

                SizedBox(
                  height: 15.0,
                ),
                Form(
                  key: authFormKey,
                  child: Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.85,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                prefixIcon: Icon(Iconsax.direct_right),
                                labelText: "Register number"),
                          ),
                        ),
                        Container(
                          width: width * 0.85,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
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
                              prefixIcon: const Icon(Iconsax.user_edit),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        IButton(
                            height: 55.0,
                            width: width * 0.85,
                            text: "LogIn",
                            isSuffixIcon: false,
                            onTap: () {
                              //authFormKey.currentState!.validate();
                              bool valid = TextFieldHelpers.validate(
                                  context: context,
                                  regNo: regNoController.text,
                                  password: passwordController.text);
                              if (!valid) return;

                              //hide keyboard
                              IDeviceUtils.hideKeyboard(context);

                              ISnackBar.clearAllSnackBars();
                              ISnackBar.customToast(
                                type: SnackBarType.success,
                                title: "Login Successfull!",
                                subTitle:
                                    "Your credentials are valid. Explore the the app now.",
                              );

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NavigationMenuBar()));
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
