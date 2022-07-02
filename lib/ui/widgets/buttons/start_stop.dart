import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final bool isRunning;
  final Function()? onPressed;
  const StartStopButton(
      {Key? key, required this.isRunning, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.orange[700] : Colors.green[700],
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              isRunning ? "Stop" : "Start",
            ),
          ),
        ),
      ),
    );
  }
}
