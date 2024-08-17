import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/profile_avatar.dart';
import 'package:induction_app/features/ceg/developers/developers.dart';
import 'package:induction_app/features/ceg/notification/notifications.dart';
import 'package:induction_app/models/user_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class IHomeAppBarCard extends StatelessWidget {
  final UserModel user;
  const IHomeAppBarCard({
    super.key,
    required this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            isMale: user.gender == "Male",
            width: 75,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: IColors.darkerGrey,
                  ),
                ),
                Text(
                  user.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                ActionButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DevelopersScreen(),
                        ));
                  },
                  iconImage: Constants.dev,
                ),
                ActionButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(
                            automaticallyImplyLeading: true,
                          ),
                        ));
                  },
                  iconImage: Constants.bell,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.onTap, required this.iconImage});
  final VoidCallback? onTap;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: IColors.lightBlue),
        child: Image.asset(
          iconImage,
          height: 30,
        ),
      ),
    );
  }
}
