import 'package:flutter/material.dart';
import 'package:induction_app/utils/color.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 50,
    this.width = 50,
    this.radius = 100.0,
    this.padding = 0,
  });
  final BoxFit? fit;

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double height, width, padding, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: IColors.white, borderRadius: BorderRadius.circular(radius)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image(
          image: AssetImage(image),
          fit: fit,
          color: overlayColor,
        ),
      ),
    );
  }
}
