import 'package:custom_paint_example/pages/example1.dart';
import 'package:custom_paint_example/pages/example2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverlayWithHole(),
    );
  }
}
