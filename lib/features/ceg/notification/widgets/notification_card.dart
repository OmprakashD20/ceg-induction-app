import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/link_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/strings.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String recencyLabel;
  final bool isFirstInGroup;
  final bool isAlerts;
  final String? url;
  final String? imagePath;
  final int index;
  const NotificationCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.recencyLabel,
    required this.isFirstInGroup,
    required this.imagePath,
    required this.url,
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
                  if (imagePath != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            imageUrl: imagePath!,
                            placeholder: (context, url) => Image.asset(
                                Constants.loader,
                                fit: BoxFit.contain),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: IColors.lightBlue),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.gallery_slash,
                                    size: 30,
                                    color: IColors.error,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Failed to load image.",
                                    style: TextStyle(
                                        color: IColors.darkGrey, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (url != null)
                    LinkCard(
                      url: url!,
                      onTap: () async {
                        IHelpers.launchLink(
                          url!,
                        );
                      },
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
