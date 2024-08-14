import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class MessageNotifCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String receiveStatus;
  final bool receiveStatusFirst;
  final bool isAlerts;
  final int index;
  const MessageNotifCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.receiveStatus,
    required this.receiveStatusFirst,
    this.isAlerts = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //if recievestatus first is true then display today yesterday old
        if (receiveStatusFirst) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(receiveStatus,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
        ],
        if (!receiveStatusFirst && !isAlerts)
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
                    color: (receiveStatus == "Today")
                        ? IColors.success.withOpacity(0.25)
                        : (receiveStatus == "Yesterday")
                            ? IColors.warning.withOpacity(0.25)
                            : IColors.error.withOpacity(0.25),
                    shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  (receiveStatus == "Today")
                      ? Iconsax.message_2
                      : (receiveStatus == "Yesterday")
                          ? Iconsax.message_tick
                          : Iconsax.message_time,
                  color: (receiveStatus == "Today")
                      ? IColors.success
                      : (receiveStatus == "Yesterday")
                          ? IColors.warning
                          : IColors.error,
                )),
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
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  //content
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      content,
                      maxLines: 10,
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.w500,
                          color: IColors.darkerGrey),
                    ),
                  ),
                  Text(
                    "$date  $time",
                    maxLines: 10,
                    style: TextStyle(fontSize: 14, color: IColors.darkGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
