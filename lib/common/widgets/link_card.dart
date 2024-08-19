import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.url,
    required this.onTap,
  });

  final String url;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: IColors.lightWhiteBlue,
          borderRadius: BorderRadius.circular(7.5)),
      padding: const EdgeInsets.all(2.5),
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: IColors.primary),
              ),
            ),
          ),
          LinkButton(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: url));
              // copied successfully
            },
            icon: Iconsax.copy,
          ),
          LinkButton(onTap: onTap, icon: Iconsax.arrow_right),
        ],
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(2.5),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: IColors.primary, borderRadius: BorderRadius.circular(7.5)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}
