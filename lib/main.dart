import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/UI/SplashScreen.dart';
import 'package:wallety/UI/wallety_screen.dart';
import 'package:wallety/Logic/CardList.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardList>(
          create: (_) => CardList(),
        )
      ],
      child: MaterialApp(
        title: 'Wallety',
        theme: ThemeData(
          primarySwatch: Constants.primaryColor,
        ),
        home: SplashScreenV(),
      ),
    );
  }
}

//
