import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:induction_app/features/ceg/faqs/faq.dart';
import 'package:induction_app/features/ceg/help/help.dart';
import 'package:induction_app/features/ceg/map/map.dart';
import 'package:induction_app/features/ceg/places/places.dart';
import 'package:induction_app/features/ceg/profile/profile.dart';
import 'package:induction_app/features/ceg/schedule/schedule.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';
import 'dart:math' as math;

class BentoGridView extends StatelessWidget {
  const BentoGridView({
    super.key,
    required this.gridUnit,
  });

  final double gridUnit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: StaggeredGrid.count(
        crossAxisCount: 18,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 11,
            child: BigGridBox(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScheduleScreen(
                            automaticallyImplyLeading: true,
                          ))),
              title: "Schedule",
              subTitle: "View the induction schedule.",
              image: Positioned(
                bottom: -gridUnit * 1,
                right: -gridUnit * 1,
                left: 0,
                child: Container(
                  //color: Colors.red,
                  height: gridUnit * 6,
                  child: Image.asset(
                    MediaStrings.scheduleBox,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 11,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 5,
            child: BigGridBox(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapFullScreen())),
              title: "CEG Map",
              subTitle: "View campus\nmap.",
              image: Positioned(
                bottom: -gridUnit * 3.75,
                right: -gridUnit * 1,
                child: Container(
                  //color: Colors.red,
                  width: gridUnit * 10,
                  child: Image.asset(
                    MediaStrings.cegMapBox,
                    fit: BoxFit.cover,
                    scale: 2.5,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 1,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 5,
            mainAxisCellCount: 5,
            child: SmallGridBox(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FAQsScreen())),
              title: "FAQs",
              subTitle: "Clear your doubts.",
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 4,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 5,
            mainAxisCellCount: 5,
            child: SmallGridBox(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen())),
              title: "Help",
              subTitle: "Stuck\nsomewhere?",
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 18,
            mainAxisCellCount: 1,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 10,
            mainAxisCellCount: 6,
            child: BigGridBox(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlacesScreen())),
              title: "CEG Places",
              subTitle: "Explore\ncampus.",
              image: Positioned(
                bottom: -gridUnit * 1.60,
                right: -gridUnit * 2,
                child: Container(
                  //color: Colors.red,
                  width: gridUnit * 12.5,
                  child: Image.asset(
                    MediaStrings.cegPlacesBox,
                    fit: BoxFit.cover,
                    scale: 2.5,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 7,
            mainAxisCellCount: 6,
            child: BigGridBox(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            automaticallyImplyLeading: true,
                          ))),
              title: "Profile",
              subTitle: "Your \nInfo.",
              image: Positioned(
                bottom: -gridUnit * 1.5,
                right: -gridUnit * 4,
                child: Container(
                    //color: Colors.red,
                    width: gridUnit * 10,
                    child: Transform.rotate(
                      angle: -math.pi / 6.0,
                      child: Image.asset(
                        MediaStrings.profileBox,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallGridBox extends StatelessWidget {
  SmallGridBox(
      {super.key, required this.title, required this.subTitle, this.onTap});
  String title;
  String subTitle;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: IColors.lightBlue,
            borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 13, color: IColors.darkerGrey),
            ),
          ],
        ),
      ),
    );
  }
}

class BigGridBox extends StatelessWidget {
  BigGridBox(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.onTap});
  String title;
  String subTitle;
  VoidCallback? onTap;
  Widget image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: IColors.lightBlue,
            borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Stack(
                children: [image],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 13, color: IColors.darkerGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
