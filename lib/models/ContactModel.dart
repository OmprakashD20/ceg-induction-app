// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        name: "Tyler Durden",
        role: "Techops Student Director",
        phone: "8072828935",
        email: "kanishka2727@gmail.com",
        contactTypeList: [
          ContactTypeModel(
            icon: MdiIcons.phoneOutline,
            text: "Call",
            function: () => IHelpers.phoneCall(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.whatsapp,
            text: "Message",
            function: () => IHelpers.whatsappMessage(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.emailOutline,
            text: "Email",
            function: () => IHelpers.sendEmail(email: "kanishka2727@gmail.com"),
          ),
        ]),
    ContactModel(
        name: "Patrick Bateman",
        role: "Techops Student Director",
        phone: "8072828935",
        email: "kanishka2727@gmail.com",
        contactTypeList: [
          ContactTypeModel(
            icon: MdiIcons.phoneOutline,
            text: "Call",
            function: () => IHelpers.phoneCall(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.whatsapp,
            text: "Message",
            function: () => IHelpers.whatsappMessage(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.emailOutline,
            text: "Email",
            function: () => IHelpers.sendEmail(email: "kanishka2727@gmail.com"),
          ),
        ]),
    ContactModel(
        name: "Jordan Belfort",
        role: "Techops Student Director",
        phone: "8072828935",
        email: "kanishka2727@gmail.com",
        contactTypeList: [
          ContactTypeModel(
            icon: MdiIcons.phoneOutline,
            text: "Call",
            function: () => IHelpers.phoneCall(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.whatsapp,
            text: "Message",
            function: () => IHelpers.whatsappMessage(phoneNo: "8072828935"),
          ),
          ContactTypeModel(
            icon: MdiIcons.emailOutline,
            text: "Email",
            function: () => IHelpers.sendEmail(email: "kanishka2727@gmail.com"),
          ),
        ])
  ];
  static List<ContactModel> helpDevs = [
    ContactModel(
        name: "Omprakash D",
        role: "Computer Science and Engineering",
        phone: "7845222018",
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
            function: () => IHelpers.whatsappMessage(phoneNo: "7845222018"),
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
        phone: "8072828935",
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
            function: () => IHelpers.whatsappMessage(phoneNo: "8072828935"),
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
