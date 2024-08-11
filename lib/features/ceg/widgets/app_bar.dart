import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/circular_image.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class IHomeAppBarCard extends StatelessWidget {
  const IHomeAppBarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: IColors.white.withOpacity(0.1)),
                child: SCircularImage(image: MediaStrings.user),
              ),
              const SizedBox(width: 10),
              SizedBox(
                  width: IDeviceUtils.getScreenWidth(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: IColors.darkerGrey)),
                      Text(
                        "Tyler Durden",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        //Icons
        Row(
          children: [
            // CircleIconButton(
            //   onPressed: () {},
            //   icon: UniconsLine.bell,
            // ),
            // CircleIconButton(
            //   onPressed: () {},
            //   icon: UniconsLine.user_plus,
            // ),
          ],
        ),
      ],
    );
  }
}
