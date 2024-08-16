import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:induction_app/features/ceg/home/widgets/carousel_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DayEventsSchedule extends StatelessWidget {
  DayEventsSchedule({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: IColors.accentListColors[index],
        child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                bool isCurrent = index == 1;
                return TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: index == 0,
                    isLast: index == 4,
                    beforeLineStyle:
                        const LineStyle(color: IColors.primary, thickness: 2),
                    afterLineStyle:
                        const LineStyle(color: IColors.primary, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: isCurrent ? 25.0 : 15.0,
                      width: isCurrent ? 25.0 : 15.0,
                      indicator: Container(
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              color: IColors.lightestBlue,
                              border:
                                  Border.all(color: IColors.primary, width: 2),
                              shape: BoxShape.circle),
                          child: isCurrent
                              ? Container(
                                  decoration: const BoxDecoration(
                                      color: IColors.primary,
                                      shape: BoxShape.circle),
                                )
                              : null),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselCard(
                        isStatusNeeded: isCurrent,
                        isBlueCard: isCurrent,
                      ),
                    ));
              }),
        ),
      ],
    ));
  }
}
