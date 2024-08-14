import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class UserInfoCard extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String title;

  final String content;
  final bool isCardSizeVariable;
  const UserInfoCard(
      {super.key,
      required this.icon,
      this.iconSize = 25.0,
      required this.title,
      required this.content,
      this.isCardSizeVariable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: IDeviceUtils.getScreenWidth(context) * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
        margin: const EdgeInsets.all(1),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //border: Border.all(color: IColors.primary, width: 1.5),
              ),
              child: Center(
                  child: Icon(
                icon,
                size: 30,
                color: IColors.primary,
              )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 13.0, color: IColors.darkerGrey)),
                  Text(content,
                      maxLines: (isCardSizeVariable) ? 3 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0, color: IColors.black)),
                ],
              ),
            ),
          ],
        ));
  }
}
