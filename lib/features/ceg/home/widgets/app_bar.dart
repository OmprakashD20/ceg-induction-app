import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/profile_avatar.dart';
import 'package:induction_app/features/ceg/developers/developers.dart';
import 'package:induction_app/features/ceg/notif/notifications.dart';
import 'package:induction_app/models/user_model.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class IHomeAppBarCard extends StatelessWidget {
  IHomeAppBarCard({
    super.key,
  });
  UserModel user = UserModel(
    name: 'Tyler Durden',
    branch: 'BE',
    dept: 'Computer Science and Engineering',
    batchId: '2024',
    dob: '01-01-2000',
    rollNo: '123456',
    gender: 'Male',
  );
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
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: IColors.darkerGrey)),
                Text(
                  user.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ],
            )),
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
                          builder: (context) => DevelopersScreen(),
                        ));
                  },
                  iconImage: MediaStrings.dev,
                ),
                ActionButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(
                            automaticallyImplyLeading: true,
                          ),
                        ));
                  },
                  iconImage: MediaStrings.bell,
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
  ActionButton({super.key, this.onTap, required this.iconImage});
  VoidCallback? onTap;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: IColors.lightBlue),
        child: Image.asset(
          iconImage,
          height: 30,
        ),
      ),
    );
  }
}
