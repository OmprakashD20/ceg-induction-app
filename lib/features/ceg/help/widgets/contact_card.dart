import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/models/ContactModel.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContatctCard extends StatelessWidget {
  ContatctCard({super.key, required this.contacts});
  final List<ContactModel> contacts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Accordion(
          headerBorderColor: Colors.transparent,
          headerBorderColorOpened: Colors.transparent,
          headerBorderWidth: 0.0,
          headerBorderRadius: 10.0,
          headerBackgroundColorOpened: Color.fromARGB(255, 255, 255, 255),
          contentBackgroundColor: Colors.white,
          headerBackgroundColor: Colors.white,
          // contentBorderColor: Colors.green,
          contentBorderWidth: 0.0,
          contentHorizontalPadding: 0.0,
          contentVerticalPadding: 0.0,
          scaleWhenAnimating: false,
          openAndCloseAnimation: true,
          headerPadding: EdgeInsets.zero,
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: contacts.map((contact) {
            return AccordionSection(
              //isOpen: true,
              rightIcon: Container(
                //color: Colors.red,
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Icon(
                  Iconsax.arrow_down_1,
                  size: 23,
                  color: IColors.darkGrey,
                ),
              ),
              header: Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.profile_circle,
                        size: 30.0,
                        color: IColors.primary,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: IDeviceUtils.getScreenWidth(context) * 0.55,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(contact.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Text(contact.role,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: IColors.darkerGrey,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
              content: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: IColors.grey, width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: contact.contactTypeList.map((contactType) {
                      return ContactButton(
                          onTap: contactType.function,
                          icon: contactType.icon,
                          text: contactType.text);
                    }).toList(),
                  )),
            );
          }).toList()),
    );
  }
}

Widget ContactButton(
    {required IconData icon, required String text, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            size: 27.5,
            color: IColors.primary,
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(text, style: TextStyle(fontSize: 14, color: IColors.darkGrey)),
        ],
      ),
    ),
  );
}
