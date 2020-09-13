import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFlexiableAppBar extends StatelessWidget {
  // final double appBarHeight = 66.0;
  const MyFlexiableAppBar();
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
              child: Text("1344.0",
                  style: TextStyle(color: Colors.amber, fontSize: 30.0)),
            )
          ],
        ),
      ),
    );
  }
}
