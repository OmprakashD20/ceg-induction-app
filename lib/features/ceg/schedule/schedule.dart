import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/schedule/widgets/tab_item.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

import 'widgets/day_events_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({super.key, this.automaticallyImplyLeading = false});
  bool automaticallyImplyLeading;
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDayIndex = 0;
  int selectedWeekIndex = 0;
  final dayPageController = PageController(
    initialPage: 0,
  );
  final weekPageController = PageController(
    initialPage: 0,
  );
  final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final weeks = [1, 2, 3];

  void onDayItemTapped(int index) {
    setState(() {
      selectedDayIndex = index;
      dayPageController.jumpToPage(index);
    });
  }

  void onWeekItemTapped({required bool isLeft}) {
    setState(() {
      selectedDayIndex = 0;
      if (isLeft && selectedWeekIndex > 0) {
        selectedWeekIndex = selectedWeekIndex - 1;
        weekPageController.jumpToPage(selectedWeekIndex);
      }
      if (!isLeft && selectedWeekIndex < 2) {
        selectedWeekIndex = selectedWeekIndex + 1;
        weekPageController.jumpToPage(selectedWeekIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: Column(children: [
          //App Bar
          ScreenAppBar(
              text: "Schedule",
              automaticallyImplyLeading: widget.automaticallyImplyLeading),
          //Week
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Row(
              children: [
                ISmallButton(
                  isBlue: true,
                  icon: Iconsax.arrow_left_2,
                  size: 22.5,
                  onTap: () => onWeekItemTapped(isLeft: true),
                ),
                Spacer(),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Induction Week ${selectedWeekIndex + 1}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                ISmallButton(
                  isBlue: true,
                  size: 22.5,
                  onTap: () => onWeekItemTapped(isLeft: false),
                )
              ],
            ),
          ),
          //TabBar
          Expanded(
            child: PageView.builder(
                controller: weekPageController,
                onPageChanged: (value) {
                  setState(() {
                    selectedDayIndex = 0;
                    selectedWeekIndex = value;
                  });
                },
                itemCount: weeks.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        width: IDeviceUtils.getScreenWidth(context),
                        child: Container(
                          //color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...List.generate(days.length, (index) {
                                return InkWell(
                                  onTap: () => onDayItemTapped(index),
                                  child: TabItem(
                                    index: index,
                                    isSelected: selectedDayIndex == index,
                                    days: days[index],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          //color: Colors.red,
                          child: PageView.builder(
                              controller: dayPageController,
                              onPageChanged: (value) {
                                setState(() {
                                  selectedDayIndex = value;
                                });
                              },
                              itemCount: days.length,
                              itemBuilder: (context, index) {
                                return DayEventsSchedule(
                                  index: index,
                                );
                              }),
                        ),
                      )
                    ],
                  );
                })),
          )
        ]),
      ),
    );
  }
}
