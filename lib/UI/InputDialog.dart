import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget {
  createInputDialog(BuildContext context, String title) {
    //TODO Complete the Dialog implementation and logic
    final DateTime selectedDate = DateTime.now();
    return showDialog(
        context: context,
        builder: (context) {
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
                child: Column(
                  children: <Widget>[
                    Text("Income"),
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Enter income's value"),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Enter income's title"),
                    ),
                    Container(
                        child: TextField(
                      onTap: () async {
                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101));
                      },
                      decoration:
                          InputDecoration(hintText: "Enter income's date"),
                    )),
                    CloseButton(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
