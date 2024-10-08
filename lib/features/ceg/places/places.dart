import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/button.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/common/widgets/small_button.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/strings.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityHandler(successWidget: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const ILoaderScreen(
            content: Constants.loadingLoader,
          );
        }
        if (state is UserError) {
          return const ILoaderScreen(
            content: Constants.error404Loader,
          );
        }
        if (state is UserLoaded) {
          final places = state.places;
          return Scaffold(
            backgroundColor: IColors.lightestBlue,
            body: ScreenBackground(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const ScreenAppBar(
                    text: "CEG Places",
                    automaticallyImplyLeading: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: places?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 170.0,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100.0,
                                //color: Colors.amber,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      child: CachedNetworkImage(
                                          height: 100.0,
                                          width: double.infinity,
                                          imageUrl: places![index].imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Image.asset(Constants.loader,
                                                  fit: BoxFit.contain),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  Constants.placeholder)),
                                    ),
                                    Positioned(
                                      top: 10.0,
                                      right: 10.0,
                                      child: ISmallButton(
                                        onTap: () {
                                          showImageDialog(
                                            context,
                                            places[index].name,
                                            places[index].imageUrl,
                                            places[index].mapLink,
                                          );
                                        },
                                        size: 25,
                                        padding: 7.5,
                                        icon: Iconsax.maximize_21,
                                        iconColor: Colors.black,
                                        buttonColor:
                                            Colors.white.withOpacity(0.5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            places[index].name,
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          IHelpers.openMap(
                                            places[index].mapLink,
                                          );
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7.5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: IColors.primary
                                                .withOpacity(0.8),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          child: const Icon(
                                            Iconsax.map_1,
                                            color: IColors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              )),
            ),
          );
        }
        return Container();
      },
    ));
  }

  void showImageDialog(
      BuildContext context, String title, String imageUrl, String mapUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: IColors.lightWhiteBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Image.asset(Constants.loader, fit: BoxFit.contain),
                      errorWidget: (context, url, error) =>
                          Image.asset(Constants.placeholder)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: IButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        margin: 0.0,
                        icon: Iconsax.close_square,
                        isPrefixIcon: true,
                        text: "Exit",
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: IButton(
                        onTap: () {
                          IHelpers.openMap(mapUrl);
                        },
                        margin: 0.0,
                        icon: Iconsax.arrow_right,
                        isPrefixIcon: true,
                        text: "Maps",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
