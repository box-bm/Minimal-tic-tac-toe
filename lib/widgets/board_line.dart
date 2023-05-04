import 'package:flutter/material.dart';

class BoardLine extends CustomPainter {
  final Size screenDimensions;
  final Color color;

  const BoardLine(
      {required this.screenDimensions, this.color = Colors.blueAccent});

  @override
  void paint(Canvas canvas, Size size) {
    double screenWidth = screenDimensions.width;

    var paint = Paint();
    paint.color = color;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.stroke;

    canvas.rotate(45);
    canvas.drawRRect(
        RRect.fromLTRBR(0, 0, screenWidth, 10, const Radius.circular(10)),
        paint);

    // canvas.drawLine(
    //   Offset(screenWidth * 0.5, screenWidth),
    //   Offset(screenWidth * 0.5, 0),
    //   paint,
    // );
    // canvas.drawLine(
    //   Offset(screenWidth * 0.16, screenWidth),
    //   Offset(screenWidth * 0.16, 0),
    //   paint,
    // );
    // canvas.drawLine(
    //   Offset(screenWidth * 0.84, screenWidth),
    //   Offset(screenWidth * 0.84, 0),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
