import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/circular_image.dart';
import 'package:induction_app/features/ceg/notif/notifications.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class IHomeAppBarCard extends StatelessWidget {
  const IHomeAppBarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
      GestureDetector(
        onTap: () {
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationScreen(
                          automaticallyImplyLeading: true,
                        )));
          }
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              //border: Border.all(color: Colors.white, width: 1.5),
              shape: BoxShape.circle,
              color: IColors.lightBlue),
          // child: Icon(
          //   Iconsax.notification,
          //   color: IColors.white,
          //   size: 20,
          // ),
          child: Image.asset(
            MediaStrings.bell,
            height: 30,
          ),
        ),
      )
    ]);
  }
}
