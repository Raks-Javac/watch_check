import 'package:flutter/material.dart';
import 'package:watch_check/ui/splash_screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch Check',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          //     textTheme: GoogleFonts.orbi(
          //   Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          // ),
        ),
        home: const SplashScreen());
  }
}
