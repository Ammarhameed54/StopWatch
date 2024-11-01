import 'dart:math';

import 'package:flutter/material.dart';

class StopwatchPainter extends CustomPainter {
  final Animation<double> animation;
  StopwatchPainter(this.animation) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    // width , Height , Radius , Center
    final Size(:width, :height) = size;
    final radius = min(width, height) / 2;
    final center = Offset(width / 2, height / 2);

    // Shadow Paint
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    // Paint of Circle
    final circlePaint = Paint()..color = const Color(0xFFF7F7F7);

    // Paint for tick of minutes or Seconds (60-12 hours) ticks
    final Paint tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = width * 0.008;

    // BoldTick Paint for hours multuiple of 5 ()
    final Paint boldTickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = width * 0.02;

    // Neeedle Base Paint
    final Paint basePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Base 2 Paint
    final Paint base2Paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Needle Paint

    final Paint needlePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = width * 0.015
      ..strokeCap = StrokeCap.round;

    // Draw EveryThing

    // Draw Shadow (slightly larger than the main circle)
    canvas.drawCircle(center, radius + width * 0.04, shadowPaint);
    // Draw Circle
    canvas.drawCircle(center, radius, circlePaint);

    // Draw Base for Needle
    double baseRadius = width * 0.04; // Size of the needle base circle
    canvas.drawCircle(center, baseRadius, basePaint);

    // Base 2
    double base2Radius = width * 0.02; // Size of the needle base circle
    canvas.drawCircle(center, base2Radius, base2Paint);

    // Draw Needle for Seconds
    // double secondsAngle =
    //     (animation.value * 360 * 60) * pi / 180; // Full circle in 60 seconds
    // double secondHandX = center.dx + (radius - 20) * cos(secondsAngle - pi / 2);
    // double secondHandY = center.dy + (radius - 20) * sin(secondsAngle - pi / 2);
    // canvas.drawLine(center, Offset(secondHandX, secondHandY), needlePaint);

    // Calculate the angle for the seconds hand
    double secondsAngle =
        (animation.value * 360 * 60) * pi / 180; // Full circle in 60 seconds

// // Adjust the length of the second hand needle
    double needleLengthOffset =
        height * 0.08; // Offset value to make the needle shorter
    double secondHandX =
        center.dx + (radius - needleLengthOffset) * cos(secondsAngle - pi / 2);
    double secondHandY =
        center.dy + (radius - needleLengthOffset) * sin(secondsAngle - pi / 2);

// // Draw the second hand
    canvas.drawLine(center, Offset(secondHandX, secondHandY), needlePaint);

    //  Draw ticks and numbers

    for (int i = 0; i < 60; i++) {
      double angle = (i * 6) * pi / 180;
      double startX = center.dx + radius * cos(angle);
      double startY = center.dy + radius * sin(angle);
      double endX = center.dx + (radius - 10) * cos(angle);
      double endY = center.dy + (radius - 10) * sin(angle);

      if (i % 5 == 0) {
        // Draw bold tick marks for multiples of 5
        canvas.drawLine(
            Offset(startX, startY), Offset(endX, endY), boldTickPaint);

        // Draw numbers for multiples of 5
        int number = i == 0 ? 60 : i;
        _drawText(
          canvas,
          size,
          '$number',
          angle,
          radius - width * 0.07, // Adjust distance for numbers
        );
      } else {
        // Draw regular tick marks
        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
      }
    }
  }

  @override
  bool shouldRepaint(StopwatchPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(StopwatchPainter oldDelegate) => true;
}

// Function to Draw text paint
// Function to draw the text for numbers
void _drawText(
    Canvas canvas, Size size, String text, double angle, double radius) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  double x =
      size.width / 2 + radius * cos(angle - pi / 2) - textPainter.width / 2;
  double y =
      size.height / 2 + radius * sin(angle - pi / 2) - textPainter.height / 2;

  textPainter.paint(canvas, Offset(x, y));
}
