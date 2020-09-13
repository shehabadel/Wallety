import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  String Test;
  CardDetails(String Test) {
    this.Test = Test;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement UI Shape for the CardDetails
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.redAccent,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Text(
            "$Test",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
  }
}
