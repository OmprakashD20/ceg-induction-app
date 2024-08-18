import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

class IAccordianWidget extends StatelessWidget {
  const IAccordianWidget({super.key, required this.accordionSectionList});
  final List<AccordionSection> accordionSectionList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Accordion(
        headerBorderColor: Colors.transparent,
        headerBorderColorOpened: Colors.transparent,
        headerBorderWidth: 0.0,
        headerBorderRadius: 10.0,
        headerBackgroundColorOpened: const Color.fromARGB(255, 255, 255, 255),
        contentBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        // contentBorderColor: Colors.green,
        contentBorderWidth: 0.0,
        contentHorizontalPadding: 0.0,
        contentVerticalPadding: 0.0,
        scaleWhenAnimating: false,
        openAndCloseAnimation: true,
        headerPadding: EdgeInsets.zero,
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: accordionSectionList,
      ),
    );
  }
}
