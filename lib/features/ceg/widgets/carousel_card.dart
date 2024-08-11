import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: IColors.success,
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
                  IconText(text: "09:00AM - 10:00AM"),
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
                    color: IColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.0,
              ),
              IconText(
                  icon: Iconsax.location5, text: "Vivek Auditorium", big: true),
              Spacer(),
              IconText(text: "Aug 12,2023"),
            ],
          ),
        ),
        Positioned(
          bottom: 15.0,
          right: 15.0,
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration:
                BoxDecoration(color: IColors.primary, shape: BoxShape.circle),
            child: Icon(
              Iconsax.arrow_right_3,
              size: 17.5,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

Widget IconText({IconData? icon, required String text, bool big = false}) {
  return Row(
    children: [
      icon == null
          ? SizedBox()
          : Icon(
              icon,
              color: big ? IColors.darkerGrey : IColors.darkGrey,
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
            color: big ? IColors.darkerGrey : IColors.darkGrey,
            fontWeight: big ? FontWeight.w500 : null),
      ),
    ],
  );
}
