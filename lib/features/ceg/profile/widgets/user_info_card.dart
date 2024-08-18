import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

class UserInfoCard extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String title;
  final EdgeInsets padding;
  final String content;
  final bool isCardSizeVariable;
  final bool isIconBlue;
  const UserInfoCard(
      {super.key,
      required this.icon,
      this.iconSize = 30.0,
      required this.title,
      this.isIconBlue = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      required this.content,
      this.isCardSizeVariable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.red,
        padding: padding,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10.0),
              child: Icon(
                icon,
                size: iconSize,
                color: isIconBlue ? IColors.primary : IColors.darkGrey,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 13.0, color: IColors.darkerGrey),
                  ),
                  Text(
                    content,
                    maxLines: (isCardSizeVariable) ? 3 : 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 15.0, color: IColors.black),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
