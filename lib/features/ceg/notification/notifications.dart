import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/preference_manager.dart';
import 'package:intl/intl.dart';

import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/empty_box.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/notification/widgets/notification_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, this.automaticallyImplyLeading = false});
  final bool automaticallyImplyLeading;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
    return ConnectivityHandler(successWidget: BlocBuilder<UserBloc, UserState>(
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
          final notifications = state.notifications;
          final isEmpty = notifications?.isEmpty;
          return Scaffold(
            backgroundColor: IColors.lightestBlue,
            body: ScreenBackground(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenAppBar(
                      text: "Notifications",
                      automaticallyImplyLeading:
                          widget.automaticallyImplyLeading,
                    ),
                    isEmpty!
                        ? const EmptyBoxMessageLoader(
                            content:
                                "No notifications yet. Check back later for updates!",
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(bottom: 100.0),
                            itemCount: notifications?.length,
                            itemBuilder: (context, index) {
                              final notification = notifications![index];

                              String date = DateFormat.yMMMd()
                                  .format(notification.dateTime)
                                  .toString();
                              String time = DateFormat.jm()
                                  .format(notification.dateTime)
                                  .toString();

                              return NotificationCard(
                                index: index,
                                title: notification.title,
                                content: notification.content ?? "",
                                date: date,
                                time: time,
                                recencyLabel: notification.recencyLabel!.label,
                                isFirstInGroup: notification.isFirstInGroup!,
                              );
                            },
                          )
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    ));
  }
}
