import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class ILoaderScreen extends StatelessWidget {
  const ILoaderScreen({super.key, required this.content});
  final Map<String, String> content;
  @override
  Widget build(BuildContext context) {
    double width = IDeviceUtils.getScreenWidth(context);
    return Scaffold(
      backgroundColor: IColors.lightWhiteBlue,
      body: SizedBox(
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.75),
                child: Lottie.asset(content["lottie"]!,
                    fit: BoxFit.cover,
                    height: width * 0.75,
                    width: width * 0.75),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 5.0),
                child: Text(
                  content["title"]!,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
              Text(content["subTitle"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15.0, color: IColors.darkGrey))
            ],
          ),
        ),
      ),
    );
  }
}
