import 'dart:math';
import 'package:flutter/material.dart';

class ClockSecondsTickerMarker extends StatelessWidget {
  final int seconds;
  final double radius;
  const ClockSecondsTickerMarker(
      {Key? key, required this.seconds, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.orange : Colors.grey[700];
    const width = 1.2;
    double height = seconds % 5 == 0 ? 15.0 : 8.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;

  const ClockTextMarker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 40.0;
    const height = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2.0, -height / 2.0, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(
          pi - 2 * pi * (value / maxValue),
        ),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
