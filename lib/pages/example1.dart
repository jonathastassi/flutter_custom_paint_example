import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 80),
        color: Colors.yellow,
        child: CustomPaint(
          painter: SmilePainter(),
        ),
      ),
    );
  }
}

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = new Color(0x00000000)
      ..blendMode = BlendMode.clear;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(20, 40, 100, 100),
          Radius.circular(20),
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
