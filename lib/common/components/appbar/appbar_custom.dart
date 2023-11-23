import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final double barHeight = 50.0;
  const CustomAppBar({
    Key? key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            color: Color.fromARGB(255, 52, 203, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 20));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final hightPoint = size.height - 100;
    final midPoint = size.width / 1;
    path.lineTo(0, lowPoint);
    path.quadraticBezierTo(size.width / 4, hightPoint, midPoint, lowPoint);
    // path.quadraticBezierTo(  size.width / 2, size.height, size.width, size.height - 20);
    // path.quadraticBezierTo(size.width / 4, hightPoint, size.width, lowPoint);
    // path.quadraticBezierTo(  3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
