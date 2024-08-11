import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/utils/color.dart';

class TextFieldHelpers {
  static bool validate(
      {required BuildContext context, String? regNo, String? password}) {
    bool regNoValid =
        regNo == null || regNo.isEmpty || int.tryParse(regNo) == null;
    bool passValid =
        password == null || password.isEmpty || int.tryParse(password) == null;
    if (regNoValid && passValid) {
      TLoaders.customToast(
          type: SnackBarType.error,
          title: "Invalid Credentials",
          subTitle:
              "Register number and Password must not be empty and should contain only digits.",
          context: context);
      return false;
    } else if (regNoValid) {
      TLoaders.customToast(
          type: SnackBarType.error,
          title: "Invalid Credentials",
          subTitle:
              "Register number must not be empty and should contain only digits",
          context: context);
      return false;
    } else if (passValid) {
      TLoaders.customToast(
          type: SnackBarType.error,
          title: "Invalid Credentials",
          subTitle: "Password must not be empty and should contain only digits",
          context: context);
      return false;
    }

    return true;
  }

  static InputDecoration inputDecoration(
      {required Widget prefixIcon,
      required String labelText,
      required double tfBorderRadius}) {
    return InputDecoration(
      prefixIcon: prefixIcon,

      labelText: labelText,
      errorMaxLines: 3,
      prefixIconColor: IColors.black,
      suffixIconColor: IColors.darkGrey,
      // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
      labelStyle:
          const TextStyle().copyWith(fontSize: 15, color: IColors.black),
      hintStyle: const TextStyle().copyWith(
        fontSize: 15,
        color: IColors.black,
      ),
      errorStyle: const TextStyle().copyWith(
          fontStyle: FontStyle.normal, color: IColors.warning, fontSize: 13.0),
      floatingLabelStyle:
          const TextStyle().copyWith(color: IColors.black.withOpacity(0.8)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(tfBorderRadius),
        borderSide:
            const BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(tfBorderRadius),
        borderSide: const BorderSide(
            width: 1, color: Color.fromARGB(255, 255, 255, 255)),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(tfBorderRadius),
        borderSide: const BorderSide(width: 1, color: IColors.black),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(tfBorderRadius),
        borderSide: const BorderSide(width: 1, color: IColors.warning),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(tfBorderRadius),
        borderSide: const BorderSide(width: 1, color: IColors.warning),
      ),
    );
  }
}
