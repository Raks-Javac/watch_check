import 'package:flutter/material.dart';
import 'package:watch_check/animation/page_transition.dart';
import 'package:watch_check/ui/stop_watch.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _popOffStackSplashScreen();
    super.initState();
  }

  Future _popOffStackSplashScreen() {
    return Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(PreviewSlideRoute(
          preview: const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: AspectRatio(aspectRatio: 0.85, child: HomeScreen()),
            ),
          ),
          duration: 650));
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/time_logo.png",
          width: _width / 1.4,
          height: _height / 1.4,
        ),
      ),
    );
  }
}
