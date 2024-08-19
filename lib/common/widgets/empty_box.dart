import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:lottie/lottie.dart';

class EmptyBoxMessageLoader extends StatelessWidget {
  const EmptyBoxMessageLoader({
    super.key,
    this.title = "Empty Box!",
    required this.content,
    this.lottieImage = Constants.emptyBox,
    this.isRounded = false,
  });
  final String title;
  final String content;
  final String lottieImage;
  final bool isRounded;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: IDeviceUtils.getScreenHeight(context) * 0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: IDeviceUtils.getScreenWidth(context) * 0.1),
        child: Column(
          children: [
            SizedBox(
                height: IDeviceUtils.getScreenWidth(context) * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      IDeviceUtils.getScreenWidth(context) * 0.8),
                  child: Lottie.asset(lottieImage,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.8),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: IColors.darkGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
