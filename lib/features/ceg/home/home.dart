import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/home/widgets/app_bar.dart';
import 'package:induction_app/features/ceg/home/widgets/bento_grid.dart';
import 'package:induction_app/features/ceg/home/widgets/carousel_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:induction_app/utils/strings.dart';

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
                      CarouselSlider(
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
