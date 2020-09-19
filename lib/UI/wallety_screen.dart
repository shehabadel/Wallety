import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallety/UI/IncomeDialog.dart';
import 'package:wallety/UI/flexiableAppBar.dart';
import 'package:wallety/UI/CardDetails.dart';
import 'package:wallety/Logic/CardList.dart';
import 'dart:io' show Platform;
import 'package:wallety/UI/titleAppBar.dart';
import 'package:provider/provider.dart';

class WalletyScreen extends StatelessWidget {
  static List<Widget> CardLists = [
    CardDetails("Macdonalds", "14-12-2040 3:00PM", "400"),
    CardDetails("Gas", "14-12-2040 2:00PM", "100"),
    CardDetails("Groceries", "12-1-2040", "700"),
    CardDetails("Gas", "14-12-2040 2:00PM", "100"),
    CardDetails("Macdonalds", "14-13-2040", "800")
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CardList>(builder: (_, cardList, __) {
      return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          //TODO implement SliverList
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250.0),
                    bottomRight: Radius.circular(10.0))),
            centerTitle: true,
            title: Center(child: new titleAppBar()),
            expandedHeight: 180.0,
            flexibleSpace:
                FlexibleSpaceBar(background: new MyFlexiableAppBar()),
            pinned: true,
          ),

          //must be updated with the new changes in the cardList
          //must show the new incomes and expenses added, from the CardDetails widget
          SliverList(delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Consumer<CardList>(builder: (context, cardList, child) {
              return ListView.builder(
                itemCount: cardList.getCardList().length,
                itemBuilder: (context, index) {
                  return cardList.getCardList().elementAt(index);
                },
              );
            });
          }))
        ]),
        floatingActionButton: FabCircularMenu(
          fabOpenIcon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          fabCloseIcon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          ringColor: Color.fromRGBO(50, 78, 207, .4),
          fabColor: Color(0xFF324ecf),
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle, color: Colors.white),
                iconSize: 50.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return IncomeDialog();
                        //return IncomeDialog();
                      });
                  //inputDialog.createInputDialog(context, 'Income');
                  print("Incremented");
                }),
            IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.white),
                iconSize: 50.0,
                onPressed: () {
                  print("Decremented");
                }),
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () {
                  print("Reset");
                })
          ],
        ),
      );
    });
  }
}
