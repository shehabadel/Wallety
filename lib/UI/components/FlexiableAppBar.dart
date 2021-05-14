import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallety/Logic/CardList.dart';

class MyFlexiableAppBar extends StatelessWidget {
  // final double appBarHeight = 66.0;
  MyFlexiableAppBar();
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // TODO: implement build
    return new Container(
      padding: EdgeInsets.only(top: 20.0),
      margin: EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "Balance",
                style: TextStyle(
                    color: Colors.white, fontSize: 50.0, fontFamily: 'Touche'),
              ),
            ),
            Container(
                child: Consumer<CardList>(builder: (context, cardList, child) {
              //updates the Balance with the current balance
              return Text("0.0}",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30.0,
                      fontFamily: 'Touche'));
            }))
          ],
        ),
      ),
    );
  }
}
