import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:induction_app/utils/color.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key,
      required this.isSelected,
      required this.days,
      required this.index});
  final bool isSelected;
  final int index;
  final String days;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 32),
      //color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //ICON
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              days,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: IColors.darkerGrey),
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            "${index + 20}",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 2.5,
          ),
          //ANIMATED LINE
          AnimatedContainer(
            margin: const EdgeInsets.only(bottom: 2),
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: isSelected ? 20 : 0,
            decoration: const BoxDecoration(
                color: IColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                )),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
