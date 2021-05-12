import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/UI/screens/WalletyScreen.dart';
import 'package:wallety/UI/screens/wallety_screen.dart';
import 'package:wallety/constants.dart';

class SplashScreenV extends StatefulWidget {
  @override
  _SplashScreenVState createState() => _SplashScreenVState();
}

class _SplashScreenVState extends State<SplashScreenV> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement reading data to fetch existing wallet, if no wallet exist create new one.

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
