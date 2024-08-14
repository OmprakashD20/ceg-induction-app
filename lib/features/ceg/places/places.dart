import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IColors.lightestBlue,
      body: ScreenBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            ScreenAppBar(
              text: "CEG Places",
              automaticallyImplyLeading: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200.0, crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 100.0,
                              //color: Colors.amber,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    child: Image.asset(
                                      height: 100.0,
                                      width: double.infinity,
                                      MediaStrings.cegFullPic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    right: 10.0,
                                    child: ISmallButton(
                                      onTap: () {
                                        showImageDialog(
                                            context, MediaStrings.cegFullPic);
                                      },
                                      size: 25,
                                      padding: 7.5,
                                      icon: Iconsax.maximize_21,
                                      iconColor: Colors.white,
                                      buttonColor:
                                          Colors.white.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Red Building",
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IButton(
                              onTap: () {
                                openMap('https://flutter.dev');
                              },
                              icon: Iconsax.map_1,
                              height: 35,
                              margin: 0.0,
                              text: "Maps")
                        ],
                      ),
                    );
                  })),
            )
          ],
        )),
      ),
    );
  }

  void openMap(String mapUrl) async {
    final Uri _url = Uri.parse(mapUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: IColors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imageUrl), // Replace with your image path
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: IButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    margin: 0.0,
                    isSuffixIcon: false,
                    text: "Exit"),
              )
            ],
          ),
        );
      },
    );
  }
}
