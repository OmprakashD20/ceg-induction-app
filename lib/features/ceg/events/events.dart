import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/helpers.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/events/widgets.dart/event_list.dart';
import 'package:induction_app/models/event_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key, required this.automaticallyImplyLeading});
  final bool automaticallyImplyLeading;
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<EventModel> events = [
    EventModel(
      name: 'Tech Fest 2024',
      desc: 'Annual technical fest showcasing innovation and skills.',
      contacts: [
        Contact(name: 'John Doe', mobile: '9876543210'),
        Contact(name: 'Jane Smith', mobile: '9876543211'),
      ],
    ),
    EventModel(
      name: 'Cultural Night',
      desc: 'An evening of music, dance, and cultural performances.',
      contacts: [
        Contact(name: 'Alice Brown', mobile: '9876543220'),
        Contact(name: 'Bob Green', mobile: '9876543221'),
      ],
    ),
    // Add more events as needed
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<EventModel> filteredEvents = events
        .where((event) =>
            event.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: Column(
          children: [
            ScreenAppBar(
              text: "Events",
              automaticallyImplyLeading: true,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                cursorColor: IColors.primary,
                decoration: TextFieldHelpers.inputDecoration(
                    tfBorderRadius: 10.0,
                    prefixIcon: Icon(
                      Iconsax.receipt_search,
                      color: IColors.primary,
                    ),
                    hintText: "Search by event name.."),
              ),
            ),
            EventList(events: filteredEvents)
          ],
        ),
      ),
    );
  }
}
