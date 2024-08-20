import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';
import 'package:induction_app/utils/helpers.dart';
import 'package:induction_app/utils/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CTFBox extends StatelessWidget {
  const CTFBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        decoration: BoxDecoration(
            color: IColors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            // const Text(
            //   "developed with love by",
            //   style:
            //       TextStyle(fontSize: 14.0, color: IColors.black),
            // ),
            // const SizedBox(
            //   height: 10.0,
            // ),
            const CTFLogoTitle(),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(
                  color: Colors.pink,
                  onTap: () => IHelpers.socials(
                      link:
                          "https://www.instagram.com/ceg_tech_forum?igsh=MWp1aHBkOXljcHpibg=="),
                  icon: MdiIcons.instagram,
                ),
                SocialButton(
                  color: Colors.blue,
                  onTap: () => IHelpers.socials(
                      link: "https://www.linkedin.com/company/ceg-tech-forum/"),
                  icon: MdiIcons.linkedin,
                ),
                SocialButton(
                  color: Colors.green,
                  onTap: () =>
                      IHelpers.socials(link: "https://cegtechforum.in/"),
                  icon: MdiIcons.web,
                ),
                SocialButton(
                  color: Colors.red,
                  onTap: () => IHelpers.socials(
                      link: "https://www.youtube.com/@kurukshetraceg"),
                  icon: MdiIcons.youtube,
                ),
                SocialButton(
                  color: Colors.blueAccent,
                  onTap: () => IHelpers.sendEmail(email: Constants.hrEmail),
                  icon: MdiIcons.gmail,
                ),
              ],
            )
          ],
        ));
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
  });
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(7.5),
          //margin: const EdgeInsets.symmetric(horizontal: 7.5),
          decoration: BoxDecoration(
            color: (color == null) ? IColors.primary : color!.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: IColors.lightWhiteBlue,
            size: 25.0,
          )),
    );
  }
}

class CTFLogoTitle extends StatelessWidget {
  const CTFLogoTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(colors: [
          IColors.darkBlue,
          Color.fromARGB(255, 125, 194, 240),
          Color.fromARGB(255, 191, 239, 255),
        ], stops: [
          0,
          0.6,
          1
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Constants.ctf,
            height: 55.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "CEG Tech Forum",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  height: 1.2,
                ),
              ),
              Text(
                "An ISO 9001:2015 certified organisation",
                style: TextStyle(
                  fontSize: 9,
                  // fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
