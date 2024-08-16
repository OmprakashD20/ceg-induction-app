import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/features/ceg/home/widgets/app_bar.dart';
import 'package:induction_app/features/ceg/home/widgets/bento_grid.dart';
import 'package:induction_app/features/ceg/home/widgets/carousel_card.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/device/device_utils.dart';
import 'package:induction_app/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(const FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double gridUnit = (width - 30) / 18;

    return Scaffold(
        backgroundColor: IColors.lightestBlue,
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //App Bar
                IHomeAppBarCard(),

                //Slider
                // CarouselSlider(
                //   items: [1, 2, 3, 4].map((item) {
                //     return Builder(builder: (BuildContext context) {
                //       return CarouselCard();
                //     });
                //   }).toList(),
                //   options: CarouselOptions(
                //       viewportFraction: 0.85,
                //       padEnds: false,
                //       enableInfiniteScroll: false,
                //       height: 150),
                // ),
                SizedBox(
                  height: 15,
                ),
                //GridView
                BentoGridView(gridUnit: gridUnit),
              ],
            ),
          ),
        ));
  }
}
