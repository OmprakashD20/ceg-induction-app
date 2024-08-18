import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/accordian_widget.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_card.dart';
import 'package:induction_app/models/event_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';

class EventList extends StatelessWidget {
  const EventList({
    super.key,
    required this.events,
  });
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return IAccordianWidget(
        accordionSectionList: events.map((event) {
      return AccordionSection(
        rightIcon: Container(
          //color: Colors.red,
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: const Icon(
            Iconsax.arrow_down_1,
            size: 23,
            color: IColors.darkGrey,
          ),
        ),
        header: Container(
            //color: Colors.amber,
            padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Row(
              children: [
                const Icon(
                  Iconsax.star,
                  size: 30.0,
                  color: IColors.primary,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        event.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        event.desc,
                        // overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: IColors.darkerGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: IColors.grey, width: 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contacts",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              Column(
                children: event.contacts.map((contact) {
                  return Row(
                    children: [
                      Expanded(
                        child: UserInfoCard(
                            isIconBlue: false,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            icon: Iconsax.profile_circle,
                            title: contact.name,
                            content: contact.mobile),
                      ),
                      GestureDetector(
                        onTap: () =>
                            IHelpers.phoneCall(phoneNo: contact.mobile),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Icon(
                              Iconsax.call,
                              color: IColors.primary,
                              size: 27.5,
                            )),
                      )
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    }).toList());
  }
}
