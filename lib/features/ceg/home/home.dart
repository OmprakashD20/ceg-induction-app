import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/home/widgets/app_bar.dart';
import 'package:induction_app/features/ceg/home/widgets/bento_grid.dart';
import 'package:induction_app/features/ceg/home/widgets/carousel_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:lottie/lottie.dart';
import "dart:math" as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double gridUnit = (width - 30) / 18;

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
            final currentSchedule = IHelpers.getCurrentDaySchedule(batch);
            final sortedSchedule =
                IHelpers.getSortedHours(currentSchedule.hours);
            return Scaffold(
              backgroundColor: IColors.lightestBlue,
              body: ScreenBackground(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //App Bar
                      IHomeAppBarCard(
                        user: user,
                      ),

                      //Slider
                      currentSchedule.holiday
                          ? Container(
                              height: 150,
                              width: IDeviceUtils.getScreenWidth(context) * 0.9,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 10.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      SizedBox(
                                        //height: 190,
                                        width: IDeviceUtils.getScreenWidth(
                                                context) *
                                            0.45,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Lottie.asset(Constants.cat,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Positioned(
                                          top: 30.0,
                                          child: Text(
                                            "Holiday",
                                            style: TextStyle(
                                                color: IColors.primary,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 10, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Enjoy Your Break!",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "Take some time to relax and recharge. See you soon!",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: IColors.darkGrey),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : CarouselSlider(
                              items: sortedSchedule.map((program) {
                                return Builder(builder: (BuildContext context) {
                                  return CarouselCard(
                                    date: currentSchedule.date,
                                    program: program,
                                  );
                                });
                              }).toList(),
                              options: CarouselOptions(
                                viewportFraction: 0.85,
                                padEnds: false,
                                enableInfiniteScroll: false,
                                height: 150,
                              ),
                            ),

                      //GridView
                      BentoGridView(gridUnit: gridUnit),
                      SizedBox(
                        height: height * 0.15,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
