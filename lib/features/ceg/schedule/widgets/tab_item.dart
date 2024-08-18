import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:induction_app/utils/color.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.isSelected,
    required this.days,
    required this.date,
    required this.isDisabled,
  });

  final bool isSelected;
  final int date;
  final String days;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 32),
      //color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              days,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: isDisabled ? IColors.darkGrey : IColors.black,
              ),
            ),
          ),
          const SizedBox(height: 2.5),
          Text(
            "$date",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDisabled ? IColors.darkGrey : IColors.black,
            ),
          ),
          const SizedBox(height: 2.5),
          AnimatedContainer(
            margin: const EdgeInsets.only(bottom: 2),
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: isDisabled
                  ? IColors.error.withOpacity(0.75)
                  : IColors.primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
