import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/schedule/widgets/tab_item.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/typedefs.dart';

import '../../../models/models.dart';
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

  @override
  void initState() {
    context.read<UserBloc>().add(const FetchData());
    super.initState();
  }

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

  //todo: add batchid as a parameter
  BatchModel getStudentBatch(List<BatchModel> batches) {
    print(batches);
    return batches.firstWhere((batch) => batch.batchId == "b1");
  }

  DateModel getSelectedDate(BatchModel batch) {
    return batch.dates[selectedDayIndex];
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityHandler(
      successWidget: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return const Text("Error");
          }
          if (state is UserLoaded) {
            final schedule = state.schedule;
            final batch = getStudentBatch(schedule!.batches);
            return Scaffold(
              backgroundColor: IColors.lightestBlue,
              body: ScreenBackground(
                child: Column(children: [
                  //App Bar
                  ScreenAppBar(
                      text: "Schedule",
                      automaticallyImplyLeading:
                          widget.automaticallyImplyLeading),
                  //Week
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        ISmallButton(
                          isBlue: true,
                          icon: Iconsax.arrow_left_2,
                          size: 22.5,
                          onTap: () => onWeekItemTapped(isLeft: true),
                        ),
                        const Spacer(),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Induction Week ${selectedWeekIndex + 1}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
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
                              SizedBox(
                                width: IDeviceUtils.getScreenWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...List.generate(batch.dates.length,
                                        (index) {
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
                              Expanded(
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
                                        daySchedule: getSelectedDate(batch),
                                      );
                                    }),
                              )
                            ],
                          );
                        })),
                  )
                ]),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
