import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final Function()? onPressed;
  const ResetButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Reset",
            ),
          ),
        ),
      ),
    );
  }
}
