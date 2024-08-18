import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/features/ceg/profile/widgets/user_info_card.dart';
import 'package:induction_app/models/models.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

import '../../../../common/widgets/profile_avatar.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        //color: Color.fromARGB(255, 238, 241, 245), // Same as background color
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: IColors.primary.withOpacity(0.75),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileAvatar(
                  width: 200.0,
                  isMale: (user.gender == "Male"),
                ),
                Text(
                  user.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              UserInfoCard(
                  icon: Iconsax.profile_circle,
                  iconSize: 30.0,
                  title: "RegNo",
                  content: user.rollNo),
              UserInfoCard(
                  icon: Iconsax.book,
                  iconSize: 25.0,
                  title: "Branch",
                  content: user.branch),
              UserInfoCard(
                  icon: Iconsax.bank,
                  iconSize: 25.0,
                  title: "Department",
                  isCardSizeVariable: true,
                  content: user.dept),
              UserInfoCard(
                  icon: Iconsax.calendar_1,
                  iconSize: 25.0,
                  title: "Date of Birth",
                  content: user.dob),
              UserInfoCard(
                icon: Iconsax.profile_2user,
                iconSize: 25.0,
                title: "Gender",
                content: user.gender,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
