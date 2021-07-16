/*import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallety/Data/Sembast_DB.dart';
import 'package:wallety/UI/components/CardDetails.dart';
import 'package:wallety/UI/components/ExpenseDialog.dart';
import 'package:wallety/UI/components/FlexiableAppBar.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/UI/components/TitleAppBar.dart';
import 'package:provider/provider.dart';
import 'package:wallety/UI/components/IncomeDialog.dart';

class WalletyScreenS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardList>(builder: (_, transactionList, __) {
      return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250.0),
                    bottomRight: Radius.circular(10.0))),
            centerTitle: true,
            title: Center(child: new TitleAppBar()),
            expandedHeight: 180.0,
            flexibleSpace:
                FlexibleSpaceBar(background: new MyFlexiableAppBar()),
            pinned: true,
          ),

          //must be updated with the new changes in the cardList
          //must show the new incomes and expenses added, from the CardDetails widget

          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container();
          }, childCount: 0)),
          SizedBox(width: double.infinity, height: 50.0)
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
                icon: Icon(Icons.remove_circle, color: Colors.white),
                iconSize: 50.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ExpenseDialog();
                        //return IncomeDialog();
                      });
                  //inputDialog.createInputDialog(context, 'Income');
                  print("Decremented");
                }),
            IconButton(
                icon: Icon(Icons.add_circle, color: Colors.white),
                iconSize: 50.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return IncomeDialog();
                      });
                  //inputDialog.createInputDialog(context, 'Income');
                  print("Incremented");
                }),
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () {
                  Provider.of<CardList>(context, listen: false).reset();
                })
          ],
        ),
      );
    });
  }
}
*/