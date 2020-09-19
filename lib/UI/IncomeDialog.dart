import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallety/Logic/CardList.dart';
import 'package:wallety/UI/CardDetails.dart';
import 'package:wallety/constants.dart';
import 'package:wallety/UI/wallety_screen.dart';
import 'package:provider/provider.dart';

class IncomeDialog extends StatelessWidget {
  //In order to move to the next TextField
  FocusScopeNode _focusScopeNode = FocusScopeNode();

  TextEditingController _DateController = TextEditingController();
  TextEditingController _AmountController = TextEditingController();
  TextEditingController _DescController = TextEditingController();
  //TODO Complete the Dialog implementation and logic
  final DateTime selectedDate = DateTime.now();
  String inputDate = '';
  String inputDesc = '';
  double inputAmount = 0.0;

  var Consumer1;

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
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    //setting controller and inputValue as the input value from the user in order to show
                    //it on the textField, and saving it for later use
                    //converting value from string to double
                    _AmountController.text = value;
                    inputAmount = double.parse(_AmountController.text);

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
                    _DescController.text = Description;
                    inputDesc = _DescController.text;

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
                      inputDate = _DateController.text;
                      print(inputDate);
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
                        onPressed: () {
                          CardDetails incomeCard = new CardDetails(
                              inputDesc, inputDate, inputAmount.toString());
                          Provider.of<CardList>(context, listen: false)
                              .addCard(incomeCard);
                          Provider.of<CardList>(context, listen: false)
                              .incrementValue(inputAmount);
                          print(
                              "Value:$inputAmount#, Desc:$inputDesc*, Date:$inputDate@ ");
                          print(Provider.of<CardList>(context, listen: false)
                              .getCardList()
                              .toString());
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

class FlatButtonAdd extends StatelessWidget {
  var inputAmount, inputDesc, inputDate;
  FlatButtonAdd(this.inputAmount, this.inputDesc, this.inputDate);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        var cardListInfo = Provider.of<CardList>(context);
        print("Value:$inputAmount#, Desc:$inputDesc*, Date:$inputDate@ ");
        CardDetails incomeCard =
            new CardDetails(inputDesc, inputDate, inputAmount.toString());
        cardListInfo.addCard(incomeCard);
      },
      child: Text("Add"),
      color: Constants.primaryColorHEX,
    );
  }
}
