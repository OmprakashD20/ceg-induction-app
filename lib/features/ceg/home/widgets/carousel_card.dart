import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class CarouselCard extends StatelessWidget {
  CarouselCard(
      {super.key, this.isStatusNeeded = true, this.isBlueCard = false});
  bool isStatusNeeded;
  bool isBlueCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: IDeviceUtils.getScreenWidth(context) * 0.8,
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 10.0,
      //   vertical: 10.0,
      // ),
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: isBlueCard
                          ? IColors.success.withOpacity(0.9)
                          : IColors.success,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Now",
                      style: TextStyle(
                          color: IColors.lightGrey,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: IconText(
                  text: "09:00AM - 10:00AM",
                  icon: Iconsax.clock,
                  isBlue: isBlueCard,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Meeting by Department of Computer Science",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color:
                    isBlueCard ? Colors.white.withOpacity(0.9) : IColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.0,
          ),
          IconText(
            icon: Iconsax.location5,
            text: "Vivek Auditorium",
            big: true,
            isBlue: isBlueCard,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                text: "Aug 12,2023",
                isBlue: isBlueCard,
              ),
              ISmallButton(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget IconText(
    {IconData? icon,
    required String text,
    bool big = false,
    bool isBlue = false}) {
  return Row(
    children: [
      icon == null
          ? SizedBox()
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
      SizedBox(
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
