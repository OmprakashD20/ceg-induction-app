import 'package:flutter/material.dart';
import 'package:induction_app/common/widgets/screen_app_bar.dart';
import 'package:induction_app/features/authentication/widgets/screen_background.dart';
import 'package:induction_app/utils/color.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  // List of items for the FAQ page

  @override
  Widget build(BuildContext context) {
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
                  FAQs.faqs[index].isExpanded = !(FAQs.faqs[index].isExpanded);
                });
              },
              children: FAQs.faqs.map<ExpansionPanel>((FAQs item) {
                return ExpansionPanel(
                  canTapOnHeader: true,
                  backgroundColor: Colors.transparent,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        item.question,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Text(item.answer),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
          ],
        )),
      ),
    );
  }
}

// FAQs class to represent each FAQ
class FAQs {
  FAQs({
    required this.answer,
    required this.question,
    this.isExpanded = false,
  });

  String answer;
  String question;
  bool isExpanded;

  static List<FAQs> faqs = [
    FAQs(
      question: 'What is Flutter?',
      answer:
          'Flutter is an open-source UI software development kit created by Google.',
    ),
    FAQs(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by downloading the SDK from the official website and following the installation instructions.',
    ),
    FAQs(
      question: 'What platforms does Flutter support?',
      answer:
          'Flutter supports Android, iOS, Linux, Mac, Windows, and web platforms.',
    ),
    // Add more FAQ items here
  ];
}
