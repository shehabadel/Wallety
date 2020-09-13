import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class titleAppBar extends StatelessWidget {
  const titleAppBar();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Wallety",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                      fontFamily: 'Pacifico'),
                ),
              ),
            )
          ]),
    );
  }
}
