import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/nav_item.dart';
import 'package:induction_app/features/ceg/dummy.dart';
import 'package:induction_app/features/ceg/home/home.dart';
import 'package:induction_app/features/ceg/map/map.dart';
import 'package:induction_app/features/ceg/notif/notifications.dart';
import 'package:induction_app/features/ceg/profile/profile.dart';
import 'package:induction_app/features/ceg/schedule/schedule.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class NavigationMenuBar extends StatefulWidget {
  const NavigationMenuBar({super.key});

  @override
  _NavigationMenuBarState createState() => _NavigationMenuBarState();
}

class _NavigationMenuBarState extends State<NavigationMenuBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;

  final _icons = [
    Iconsax.map,
    Iconsax.calendar_1,
    Iconsax.home_2,
    Iconsax.notification,
    Iconsax.user,
  ];

  final _screens = [
    const CEGMapScreen(),
    ScheduleScreen(),
    const HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NAV BAR WIDGETS
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
              height: IDeviceUtils.getScreenHeight(context),
              width: IDeviceUtils.getScreenWidth(context),
              child: _screens[_selectedIndex]),
          Container(
            height: 65.0,
            width: IDeviceUtils.getScreenWidth(context) * 0.85,
            margin: EdgeInsets.only(bottom: 20),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: IColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(_screens.length, (index) {
                    return InkWell(
                      onTap: () => _onItemTapped(index),
                      child: NavItem(
                        isSelected: _selectedIndex == index,
                        icon: _icons[index],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
