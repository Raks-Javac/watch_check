import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  final Color color;
  final double handThickness;
  final double handlength;
  final double rotationZAngle;
  const ClockHand(
      {Key? key,
      required this.color,
      required this.handThickness,
      required this.handlength,
      required this.rotationZAngle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        width: handThickness,
        height: handlength,
        color: color,
      ),
    );
  }
}
