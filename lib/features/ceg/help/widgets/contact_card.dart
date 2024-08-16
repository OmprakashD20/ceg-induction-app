import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/accordian_widget.dart';
import 'package:induction_app/models/contact_model.dart';
import 'package:induction_app/utils/color.dart';

class ContatctCard extends StatelessWidget {
  const ContatctCard({super.key, required this.contacts});
  final List<ContactModel> contacts;
  @override
  Widget build(BuildContext context) {
    return IAccordianWidget(
        accordionSectionList: contacts.map((contact) {
      return AccordionSection(
        //isOpen: true,
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
                  Iconsax.profile_circle,
                  size: 30.0,
                  color: IColors.primary,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(contact.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text(contact.role,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              color: IColors.darkerGrey,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: IColors.grey, width: 1))),
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
    }).toList());
  }
}

Widget ContactButton(
    {required IconData icon, required String text, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            size: 27.5,
            color: IColors.primary,
          ),
          const SizedBox(
            height: 2.5,
          ),
          Text(text, style: const TextStyle(fontSize: 14, color: IColors.darkGrey)),
        ],
      ),
    ),
  );
}
