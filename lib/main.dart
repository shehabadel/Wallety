import 'package:flutter/material.dart';
import 'package:wallety/UI/SplashScreen.dart';
import 'package:wallety/UI/wallety_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallety',
      theme: ThemeData(
        primarySwatch: Constants.primaryColor,
      ),
      home: SplashScreenV(),
    );
  }
}

//
