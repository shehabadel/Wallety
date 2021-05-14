import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallety/Data/Sembast_DB.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/Logic/Transaction.dart';
import 'package:wallety/UI/components/CardDetails.dart';
import 'package:wallety/constants.dart';
import 'package:wallety/UI/screens/wallety_screen.dart';
import 'package:provider/provider.dart';
import 'package:wallety/UI/screens/WalletyScreen.dart';


class IncomeDialog extends StatelessWidget {
  //In order to move to the next TextField
  FocusScopeNode _focusScopeNode = FocusScopeNode();

  TextEditingController _DateController = TextEditingController();
  TextEditingController _AmountController = TextEditingController();
  TextEditingController _DescController = TextEditingController();
  DateTime selectedDate;
  //TODO Complete the Dialog implementation and logic
  String inputDate = '';
  String inputDesc = '';
  double inputAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    //var cardListInfo = Provider.of<CardList>(context);
    return Dialog(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: Colors.white,
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FocusScope(
            node: _focusScopeNode,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Income",
                    style: TextStyle(
                        fontSize: 20.0, color: Constants.primaryColor),
                  ),
                ),
                TextField(
                  //TODO add text validator
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    //setting controller and inputValue as the input value from the user in order to show
                    //it on the textField, and saving it for later use
                    //converting value from string to double
                    // _AmountController.text = value;

                    print(inputAmount);
                  },
                  controller: _AmountController,
                  decoration: InputDecoration(hintText: "Enter income's value"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 5.0),
                TextField(
                  controller: _DescController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: "Enter income's title"),
                  onSubmitted: (Description) {
                    print(inputDesc);
                  },
                ),
                Container(
                    child: TextField(
                  controller: _DateController,
                  onTap: () async {
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101))
                        .then((date) {
                      _DateController.text =
                          "${date.year}-${date.month}-${date.day}";
                      selectedDate =
                          new DateTime(date.year, date.month, date.day);
                    });
                  },
                  decoration: InputDecoration(hintText: "Enter income's date"),
                )),
                SizedBox(height: 35.0),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          //Providing the textField controller's data into some
                          //temporary variables which are used in creating a new
                          //CardDetails object which will be inserted into the CardList
                          //Model provider's list
                          inputAmount = double.parse(_AmountController.text);
                          inputDesc = _DescController.text;
                          inputDate = _DateController.text;
                          TransactionW transaction = TransactionW(
                              transType: TransactionType.Income,
                              transTitle: inputDesc,
                              transValue: inputAmount,
                              transDate: selectedDate);
                          SembastDB db = SembastDB();
                          db.addTransaction(transaction);

                          //adding it to the Model Provider's list and incrementing
                          //the balance based on the input amount

                          print(
                              "Value:$inputAmount#, Desc:$inputDesc*, Date:${selectedDate.toString()}@ ");
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WalletyScreen()));
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Constants.primaryColorHEX,
                      ),
                      CloseButton()
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
