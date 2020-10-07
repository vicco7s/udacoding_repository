import 'package:flutter/material.dart';
import 'package:karyawan_app/constant/cons.dart';




// This is the Painter class
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = kColorBlue;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, 0.9367 * size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.89, size.width, size.height * 0.9367);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
