import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/schedule/widgets/tab_item.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:induction_app/utils/strings.dart';
import 'widgets/day_events_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, this.automaticallyImplyLeading = false});
  final bool automaticallyImplyLeading;

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
  final DateTime startDate = DateTime(2024, 8, 14);
  final DateTime endDate = DateTime(2024, 9, 3);

  @override
  void initState() {
    super.initState();
    _fetchRollNoAndAddEvent();
  }

  Future<void> _fetchRollNoAndAddEvent() async {
    final PreferenceManager prefs = await PreferenceManager.getInstance();
    final rollNo =
        IHelpers.extractRightFromEither(prefs.getData<String>("rollNo"))!;

    // ignore: use_build_context_synchronously
    context.read<UserBloc>().add(FetchData(
          rollNo: rollNo,
        ));
  }

  List<List<String>> generateDates() {
    List<String> dates = [];
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      dates.add(currentDate.toIso8601String().split('T').first);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    List<List<String>> chunks = [];

    for (int i = 0; i < dates.length; i += 7) {
      int end = (i + 7 < dates.length) ? i + 7 : dates.length;
      chunks.add(dates.sublist(i, end));
    }
    return chunks;
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

  @override
  Widget build(BuildContext context) {
    return ConnectivityHandler(
      successWidget: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const ILoaderScreen(
              content: Constants.loadingLoader,
            );
          }
          if (state is UserError) {
            return const ILoaderScreen(
              content: Constants.error404Loader,
            );
          }
          if (state is UserLoaded) {
            final user = state.user;
            final schedule = state.schedule;
            final batch =
                IHelpers.getStudentBatch(schedule!.batches, user.batchId);

            final allDates = generateDates();
            final availableDates =
                batch.dates.map((dateModel) => dateModel.date);
            return Scaffold(
              backgroundColor: IColors.lightestBlue,
              body: ScreenBackground(
                child: Column(children: [
                  //App Bar
                  ScreenAppBar(
                    text: "Schedule",
                    automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  ),
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
                        itemBuilder: ((context, weekIndex) {
                          return Column(
                            children: [
                              SizedBox(
                                width: IDeviceUtils.getScreenWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...List.generate(allDates[weekIndex].length,
                                        (index) {
                                      final dateStr =
                                          allDates[weekIndex][index];
                                      final isAvailable =
                                          availableDates.contains(dateStr);
                                      final date = DateTime.parse(dateStr);
                                      final dayIndex =
                                          allDates[weekIndex].indexOf(dateStr);
                                      return InkWell(
                                        onTap: isAvailable
                                            ? () => onDayItemTapped(dayIndex)
                                            : null,
                                        child: TabItem(
                                          date: date.day,
                                          isSelected:
                                              selectedDayIndex == dayIndex,
                                          days: days[date.weekday - 1],
                                          isDisabled: !isAvailable,
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
                                        daySchedule: IHelpers.getSelectedDate(
                                            batch, selectedDayIndex),
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
