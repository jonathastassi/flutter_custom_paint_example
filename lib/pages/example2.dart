import 'package:flutter/material.dart';

class OverlayWithHole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: Stack(children: <Widget>[
          _getContent(),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: CustomPaint(
              painter: OverlayBackgroundPainter(),
            ),
          )
        ]));
  }

  Widget _getContent() {
    return Container(
        color: Colors.redAccent,
        child: Center(child: Text("This is the Background")));
  }
}

class OverlayBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()..color = Colors.black54;
    final paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final proportionHeight = 1.7;
    final widthOverlay = size.width / 2;

    final rectPicture = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width / 4, size.height * 0.2, widthOverlay,
          widthOverlay * proportionHeight),
      Radius.circular(20),
    );

    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addRRect(
              rectPicture,
            )
            ..close(),
        ),
        paintBackground);

    canvas.drawRRect(rectPicture, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
