import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/helpers.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/events/widgets.dart/event_list.dart'; // Ensure the path is correct
import 'package:induction_app/models/event_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key, required this.automaticallyImplyLeading});
  final bool automaticallyImplyLeading;

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String searchQuery = '';

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
            final List<EventModel> events = state.events!;
            final filteredEvents = events
                .where((event) => event.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
                .toList();

            return Scaffold(
              backgroundColor: IColors.lightestBlue,
              body: ScreenBackground(
                child: Column(
                  children: [
                    ScreenAppBar(
                      text: "Events",
                      automaticallyImplyLeading:
                          widget.automaticallyImplyLeading,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
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
                          prefixIcon: const Icon(
                            Iconsax.receipt_search,
                            color: IColors.primary,
                          ),
                          hintText: "Search by event name..",
                        ),
                      ),
                    ),
                    Expanded(
                      child: EventList(events: filteredEvents),
                    ),
                  ],
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
