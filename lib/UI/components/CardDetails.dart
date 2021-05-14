import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallety/Logic/Transaction.dart';

class CardDetails extends StatelessWidget {
  TransactionType cardType;
  String assetName;
  String expenseDesc;
  DateTime date;
  double expenseValue;

  CardDetails(String expenseDesc, DateTime date, double expenseValue,
      TransactionType cardType) {
    this.expenseDesc = expenseDesc;
    this.date = date;
    this.expenseValue = expenseValue;
    this.cardType = cardType;
    this.assetName = 'assets/images/$cardType.png';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement UI Shape for the CardDetails
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(assetName),
                  ),
                  Text(
                    "$expenseDesc",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$expenseValue EGP",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text("${date.year}-${date.month}-${date.day}",
                          style: TextStyle(fontSize: 15.0))
                    ],
                  )
                ],
              )),
        ));
  }
}
