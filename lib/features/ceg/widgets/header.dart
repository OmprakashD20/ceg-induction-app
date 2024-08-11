import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/circular_container.dart';
import 'package:induction_app/common/widgets/curved_edges.dart';
import 'package:induction_app/features/ceg/widgets/app_bar.dart';
import 'package:induction_app/features/ceg/widgets/carousel_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';

class IHeaderContent extends StatelessWidget {
  const IHeaderContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ICurvedEdgesWidget(
      child: Container(
        color: IColors.primary,
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Positioned(
              top: -150.0,
              right: -250.0,
              child: KCircularContainer(
                backgroundColor: IColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100.0,
              right: -300.0,
              child: KCircularContainer(
                backgroundColor: IColors.white.withOpacity(0.1),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: IDeviceUtils.getStatusBarHeight(context),
                ),
                //Profile,Name and Appbar buttons
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: IHomeAppBarCard(),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Carousel Slider
                CarouselSlider(
                    items: [1, 2, 3, 4].map((item) {
                      return Builder(builder: (BuildContext context) {
                        return CarouselCard();
                      });
                    }).toList(),
                    options: CarouselOptions(
                        viewportFraction: 0.85,
                        padEnds: false,
                        enableInfiniteScroll: false,
                        height: 150)),
                const SizedBox(
                  height: 35,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
