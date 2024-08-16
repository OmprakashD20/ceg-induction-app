
import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/empty_box.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/notif/widgets/notif_card.dart';
import 'package:induction_app/features/ceg/notif/widgets/notif_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key, this.automaticallyImplyLeading = false});
  bool automaticallyImplyLeading;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isEmpty = true;
  List<MessageNotifModel> notifs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmpty = false;
    notifs = NotificationRepository.fetchCirculars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: IColors.lightestBlue,
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenAppBar(
                  text: "Notifications",
                  automaticallyImplyLeading: widget.automaticallyImplyLeading,
                ),

                //Check circular is empty

                isEmpty
                    ? const EmptyBoxMessageLoader(
                        content:
                            "No notifications yet. Check back later for updates!",
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 100.0),
                        itemCount: notifs.length,
                        itemBuilder: (context, index) {
                          final notif = notifs[index];

                          String date = DateFormat.yMMMd()
                              .format(notif.dateTime)
                              .toString();
                          String time =
                              DateFormat.jm().format(notif.dateTime).toString();

                          return MessageNotifCard(
                              index: index,
                              title: notif.title,
                              content: notif.content,
                              date: date,
                              time: time,
                              receiveStatus: notif.receiveStatus,
                              receiveStatusFirst: notif.receiveStatusFirst);
                        })
              ],
            ),
          ),
        ));
  }
}
