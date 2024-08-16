import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/models/models.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:intl/intl.dart';

class CarouselCard extends StatelessWidget {
  final HourModel program;
  final bool isStatusNeeded;
  final bool isBlueCard;
  final String date;
  const CarouselCard({
    super.key,
    this.isStatusNeeded = true,
    this.isBlueCard = false,
    required this.program,
    required this.date,
  });

  String formatDate(String dateStr) {
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    final DateTime date = inputFormat.parse(dateStr);

    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      final DateFormat outputFormat = DateFormat('MMM d, yyyy');
      return outputFormat.format(date);
    }
  }

  String formatTimeRange(String startTime, String endTime) {
    final DateFormat inputFormat = DateFormat('HH:mm');
    final DateFormat outputFormat = DateFormat('h:mma');

    final DateTime startDateTime = inputFormat.parse(startTime);
    final DateTime endDateTime = inputFormat.parse(endTime);

    final String formattedStartTime =
        outputFormat.format(startDateTime).toLowerCase();
    final String formattedEndTime =
        outputFormat.format(endDateTime).toLowerCase();

    return '$formattedStartTime to $formattedEndTime';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: IDeviceUtils.getScreenWidth(context) * 0.8,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: isBlueCard ? IColors.primary : IColors.lightWhiteBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isStatusNeeded)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: isBlueCard
                        ? IColors.success.withOpacity(0.9)
                        : IColors.success,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Now",
                      style: TextStyle(
                        color: IColors.lightGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: IconText(
                  text: formatTimeRange(program.startTime, program.endTime),
                  icon: Iconsax.clock,
                  isBlue: isBlueCard,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            program.programName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isBlueCard ? Colors.white.withOpacity(0.9) : IColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          IconText(
            icon: Iconsax.location5,
            text: program.venue,
            big: true,
            isBlue: isBlueCard,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                text: formatDate(date),
                isBlue: isBlueCard,
              ),
              ISmallButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EventsScreen(automaticallyImplyLeading: true))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget IconText({
  IconData? icon,
  required String text,
  bool big = false,
  bool isBlue = false,
}) {
  return Row(
    children: [
      icon == null
          ? const SizedBox()
          : Icon(
              icon,
              color: big
                  ? isBlue
                      ? IColors.white.withOpacity(0.8)
                      : IColors.darkerGrey
                  : isBlue
                      ? IColors.white.withOpacity(0.65)
                      : IColors.darkGrey,
              size: 20.0,
            ),
      const SizedBox(
        width: 5.0,
      ),
      Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: big ? 15.0 : null,
            color: big
                ? isBlue
                    ? IColors.white.withOpacity(0.8)
                    : IColors.darkerGrey
                : isBlue
                    ? IColors.white.withOpacity(0.65)
                    : IColors.darkGrey,
            fontWeight: big ? FontWeight.w500 : null),
      ),
    ],
  );
}
