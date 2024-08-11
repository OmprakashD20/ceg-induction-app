import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

enum SnackBarType { success, warning, error }

class TLoaders {
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast(
      {required SnackBarType type,
      required String title,
      required String subTitle,
      required BuildContext context}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: (type == SnackBarType.success)
                ? IColors.success
                : (type == SnackBarType.warning)
                    ? IColors.warning
                    : IColors.error,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  (type == SnackBarType.success)
                      ? Iconsax.user_tick
                      : (type == SnackBarType.warning)
                          ? Iconsax.warning_2
                          : Iconsax.forbidden_2,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(subTitle,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white.withOpacity(0.9))),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  // static succcesSnackBar({required title, message = "", duration = 3}) {
  //   Get.snackbar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: TColors.white,
  //       backgroundColor: TColors.primary,
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: duration),
  //       margin: const EdgeInsets.all(10.0),
  //       icon: const Icon(
  //         Iconsax.check,
  //         color: TColors.white,
  //       ));
  // }

  // static warningSnackBar({required title, message = ""}) {
  //   Get.snackbar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: TColors.white,
  //       backgroundColor: Colors.orange,
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //       margin: const EdgeInsets.all(20.0),
  //       icon: const Icon(
  //         Iconsax.warning_2,
  //         color: TColors.white,
  //       ));
  // }

  // static errorSnackBar({required title, message = ""}) {
  //   Get.snackbar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: TColors.white,
  //       backgroundColor: Colors.red.shade600,
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //       margin: const EdgeInsets.all(20.0),
  //       icon: const Icon(
  //         Iconsax.warning_2,
  //         color: TColors.white,
  //       ));
  // }
}
