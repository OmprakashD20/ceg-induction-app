import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String recencyLabel;
  final bool isFirstInGroup;
  final bool isAlerts;
  final int index;
  const NotificationCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.recencyLabel,
    required this.isFirstInGroup,
    this.isAlerts = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final recencyStyle = Constants.notificationStyles[recencyLabel] ??
        Constants.notificationStyles['Default'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isFirstInGroup) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(recencyLabel,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
        ],
        if (!isFirstInGroup && !isAlerts)
          Divider(
            thickness: 1.1,
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.grey[300],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isAlerts)
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: recencyStyle!['background'] as Color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    recencyStyle['icon'] as IconData,
                    color: recencyStyle['color'] as Color,
                  ),
                ),
              ),
            Container(
              decoration: isAlerts
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 1.5))
                  : null,
              margin: const EdgeInsets.only(bottom: 10.0),
              width: (isAlerts)
                  ? IDeviceUtils.getScreenWidth(context) * 0.9
                  : IDeviceUtils.getScreenWidth(context) - 70.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //content
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      content,
                      maxLines: 10,
                      style: const TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w500,
                        color: IColors.darkerGrey,
                      ),
                    ),
                  ),
                  Text(
                    "$date  $time",
                    maxLines: 10,
                    style:
                        const TextStyle(fontSize: 14, color: IColors.darkGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
