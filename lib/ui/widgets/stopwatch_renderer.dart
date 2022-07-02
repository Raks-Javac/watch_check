import 'dart:math';
import 'package:flutter/material.dart';
import 'package:watch_check/ui/widgets/clock_hand.dart';
import 'package:watch_check/ui/widgets/clock_marker.dart';
import 'package:watch_check/ui/widgets/elaspsed_time.dart';

class StopWatchRenderer extends StatelessWidget {
  final Duration? elapsed;
  final double radius;
  const StopWatchRenderer(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            top: radius,
            left: radius,
            child: ClockSecondsTickerMarker(seconds: i, radius: radius),
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            // border: Border.all(color: Colors.orange, width: 1.0),
          ),
        ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(
              value: i,
              maxValue: 60,
              radius: radius,
            ),
          ),
        Positioned(
          top: radius,
          left: radius,
          child: ClockHand(
            color: Colors.orange,
            handThickness: 2.0,
            handlength: radius,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed!.inMilliseconds,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: radius * 1.35,
            child: ElaspedTimeText(elapsed: elapsed)),
      ],
    );
  }
}
