import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Colors.orange,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                )),
          ),
        ],
      ),
    );
  }
}
