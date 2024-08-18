import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/user/user_bloc.dart';
import 'package:induction_app/common/handler/connectivity_handler.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/models/models.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/strings.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  // @override
  // void initState() {
  //   context.read<UserBloc>().add(const FetchData());
  //   super.initState();
  // }

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
        } if (state is UserLoaded) {
          final faqs = state.faqs;
          return Scaffold(
            backgroundColor: IColors.lightestBlue,
            body: ScreenBackground(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScreenAppBar(
                      text: "FAQs",
                      automaticallyImplyLeading: true,
                    ),
                    ExpansionPanelList(
                      dividerColor: Colors.transparent,
                      elevation: 0.0,
                      expandIconColor: IColors.black,
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          faqs[index].isExpanded = !(faqs[index].isExpanded);
                        });
                      },
                      children: faqs!.map<ExpansionPanel>((FAQModel faq) {
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          backgroundColor: Colors.transparent,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                faq.question,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(faq.answer),
                          ),
                          isExpanded: faq.isExpanded,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    ));
  }
}
