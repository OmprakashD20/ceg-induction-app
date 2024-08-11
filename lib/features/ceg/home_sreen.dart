import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:induction_app/features/ceg/widgets/app_bar.dart';
import 'package:induction_app/features/ceg/widgets/carousel_card.dart';
import 'package:induction_app/features/ceg/widgets/header.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 248, 253),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(MediaStrings.screen),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: SizedBox(),
                ),
              ),
              SafeArea(
                  child: Column(
                children: [
                  IHomeAppBarCard(),
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
                ],
              ))
            ],
          ),
        ));
  }
}
