import 'package:flutter/material.dart';

class ICurvedEdgesWidget extends StatelessWidget {
  const ICurvedEdgesWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    // Curve
    final firstCurve = Offset(0, size.height - 20.0);
    final lastCurve = Offset(30, size.height - 20.0);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);
    //Straight Line
    final secondFirstCurve = Offset(0, size.height - 20.0);
    final secondLastCurve = Offset(size.width - 20.0, size.height - 20.0);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);
    //Curve
    final thirdFirstCurve = Offset(size.width, size.height - 20.0);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
