import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wallety/UI/wallety_screen.dart';
import 'package:wallety/constants.dart';

class SplashScreenV extends StatefulWidget {
  @override
  _SplashScreenVState createState() => _SplashScreenVState();
}

class _SplashScreenVState extends State<SplashScreenV> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SplashScreen(
      loaderColor: Colors.white,
      backgroundColor: Constants.primaryColorHEX,
      seconds: 5,
      navigateAfterSeconds: WalletyScreen(),
      title: Text(
        "Wallety",
        style: TextStyle(
            fontSize: 70.0, fontFamily: 'Pacifico', color: Colors.amber),
      ),
    );
  }
}
