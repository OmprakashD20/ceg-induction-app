import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:induction_app/features/ceg/home/widgets/carousel_card.dart';
import 'package:induction_app/models/models.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';

class DayEventsSchedule extends StatelessWidget {
  final int index;
  final DateModel daySchedule;
  const DayEventsSchedule({
    super.key,
    required this.index,
    required this.daySchedule,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100.0),
              itemCount: daySchedule.hours.length,
              itemBuilder: (context, index) {
                bool isOngoing = IHelpers.isProgramOngoing(
                  daySchedule.hours[index].startTime,
                  daySchedule.hours[index].endTime,
                  daySchedule.date,
                );
                return TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: index == 0,
                  isLast: index == daySchedule.hours.length - 1,
                  beforeLineStyle:
                      const LineStyle(color: IColors.primary, thickness: 2),
                  afterLineStyle:
                      const LineStyle(color: IColors.primary, thickness: 2),
                  indicatorStyle: IndicatorStyle(
                    height: isOngoing ? 25.0 : 15.0,
                    width: isOngoing ? 25.0 : 15.0,
                    indicator: Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        color: IColors.lightestBlue,
                        border: Border.all(color: IColors.primary, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: isOngoing
                          ? Container(
                              decoration: const BoxDecoration(
                                color: IColors.primary,
                                shape: BoxShape.circle,
                              ),
                            )
                          : null,
                    ),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselCard(
                      isBlueCard: isOngoing,
                      program: daySchedule.hours[index],
                      date: daySchedule.date,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
