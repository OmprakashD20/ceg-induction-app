import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:induction_app/utils/helpers.dart';

class ContactModel {
  final String name;
  final String role;
  final String phone;
  final String email;
  final List<ContactTypeModel> contactTypeList;
  ContactModel({
    required this.name,
    required this.role,
    required this.phone,
    required this.email,
    required this.contactTypeList,
  });

  static List<ContactModel> helpContacts = [
    ContactModel(
      name: "M.G.Rahul Prasanth",
      role: "SAAS Vice President",
      phone: "+91 76399 86586",
      email: "kanishka2727@gmail.com",
      contactTypeList: [
        ContactTypeModel(
          icon: MdiIcons.phoneOutline,
          text: "Call",
          function: () => IHelpers.phoneCall(phoneNo: "+91 76399 86586"),
        ),
        ContactTypeModel(
          icon: MdiIcons.whatsapp,
          text: "Message",
          function: () => IHelpers.whatsappMessage(phoneNo: "+91 76399 86586"),
        ),
        ContactTypeModel(
          icon: MdiIcons.emailOutline,
          text: "Email",
          function: () => IHelpers.sendEmail(email: ""),
        ),
      ],
    ),
    ContactModel(
      name: "Saranya",
      role: "SAAS Vice President",
      phone: "+91 6381 556 672",
      email: "kanishka2727@gmail.com",
      contactTypeList: [
        ContactTypeModel(
          icon: MdiIcons.phoneOutline,
          text: "Call",
          function: () => IHelpers.phoneCall(phoneNo: "+91 6381 556 672"),
        ),
        ContactTypeModel(
          icon: MdiIcons.whatsapp,
          text: "Message",
          function: () => IHelpers.whatsappMessage(phoneNo: "+91 6381 556 672"),
        ),
        ContactTypeModel(
          icon: MdiIcons.emailOutline,
          text: "Email",
          function: () => IHelpers.sendEmail(email: ""),
        ),
      ],
    ),
  ];
  static List<ContactModel> helpDevs = [
    ContactModel(
        name: "Omprakash D",
        role: "Computer Science and Engineering",
        phone: "+91 78452 22018",
        email: "omprakashd10051@gmail.com",
        contactTypeList: [
          ContactTypeModel(
            icon: MdiIcons.instagram,
            text: "Instagram",
            function: () => IHelpers.socials(
                link:
                    "https://www.instagram.com/omprakash_d_79?igsh=MTF2OXhkdGRyMHJkOA=="),
          ),
          ContactTypeModel(
            icon: MdiIcons.whatsapp,
            text: "Whatsapp",
            function: () => IHelpers.whatsappMessage(phoneNo: "+91 78452 22018"),
          ),
          ContactTypeModel(
            icon: MdiIcons.linkedin,
            text: "LinkedIn",
            function: () => IHelpers.socials(
                link: "https://www.linkedin.com/in/omprakash-d/"),
          ),
        ]),
    ContactModel(
        name: "Kanishka S",
        role: "Computer Science and Engineering",
        phone: "+91 80728 28935",
        email: "kanishka2727@gmail.com",
        contactTypeList: [
          ContactTypeModel(
            icon: MdiIcons.instagram,
            text: "Instagram",
            function: () => IHelpers.socials(
                link:
                    "https://www.instagram.com/kan15hka?igsh=ZmxwOGl4N214NmNo"),
          ),
          ContactTypeModel(
            icon: MdiIcons.whatsapp,
            text: "Whatsapp",
            function: () => IHelpers.whatsappMessage(phoneNo: "+91 80728 28935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.linkedin,
            text: "LinkedIn",
            function: () => IHelpers.socials(
                link: "https://www.linkedin.com/in/kanishka-s-763062223/"),
          ),
        ]),
  ];
}

class ContactTypeModel {
  final IconData icon;
  final String text;
  final VoidCallback function;
  ContactTypeModel({
    required this.icon,
    required this.text,
    required this.function,
  });
}
