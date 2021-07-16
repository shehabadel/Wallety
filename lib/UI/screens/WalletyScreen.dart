import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sembast/sembast.dart';
import 'package:wallety/Data/Sembast_DB.dart';
import 'package:wallety/UI/components/CardDetails.dart';
import 'package:wallety/UI/components/ExpenseDialog.dart';
import 'package:wallety/UI/components/FlexiableAppBar.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/UI/components/TitleAppBar.dart';
import 'package:provider/provider.dart';
import 'package:wallety/UI/components/IncomeDialog.dart';
import 'package:wallety/Logic/Transaction.dart';

class WalletyScreen extends StatefulWidget {
  @override
  _WalletyScreenState createState() => _WalletyScreenState();
}

class _WalletyScreenState extends State<WalletyScreen> {
  SembastDB db;

  @override
  void initState() {
    db = SembastDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          flexibleSpace: FlexibleSpaceBar(background: new MyFlexiableAppBar()),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(child: Text("Hello")),
        ]))
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
                db.deleteAll();
                print("reset");
              })
        ],
      ),
    );
  }

  Future<List<TransactionW>> getTransactions() async {
    List<TransactionW> transactions = await db.getTransactions();
    return transactions;
  }
}

/*
SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return cardList.getCardList()[index];
        }, childCount: cardList.getCardList().length))
*/


  



  /*
  SliverList(delegate: SliverChildBuilderDelegate((context, index){
              return Container(
                child: FutureBuilder(future: getTransactions(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                {}
                )
              );
            }))
            */

            // build fixed items outside of the FutureBuilder for efficiency


/*SliverList cardsSliverList;
  FutureBuilder<List<TransactionW>> getSliver() {
    return FutureBuilder(
        future: getTransactions(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<TransactionW> transactions = snapshot.data;
            cardsSliverList = SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => CardDetails(
                        transactions[index].transDesc,
                        transactions[index].transDate,
                        transactions[index].transValue,
                        transactions[index].transType),
                    childCount: transactions.length));
          }
        });
  }*/

  /*
SliverList newListSliver;
  void getTransactionCards() {
    FutureBuilder(
        future: getTransactions(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<TransactionW> transactions = snapshot.data;
            newListSliver = new SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return CardDetails(
                  transactions[index].transDesc,
                  transactions[index].transDate,
                  transactions[index].transValue,
                  transactions[index].transType);
            }, childCount: transactions.length));
          } else {
            newListSliver = new SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Container(child: Text("Empty for now"));
            }, childCount: 0));
          }
        });
  }
  */
  /*
  FutureBuilder(
          future: getTransactions(),
          builder: (context, snapshot) {
            Widget cardsSliverList;
            if (snapshot.hasData) {
              List<TransactionW> transactions = snapshot.data;
              cardsSliverList = SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return CardDetails(
                    transactions[index].transDesc,
                    transactions[index].transDate,
                    transactions[index].transValue,
                    transactions[index].transType);
              }, childCount: transactions.length));
            } else {
              cardsSliverList = SliverToBoxAdapter(
                child: Center(
                    child: Container(
                        height: 10.0,
                        width: 10.0,
                        child: CircularProgressIndicator())),
              );
            }
  */
