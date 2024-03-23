// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text('Enable Buttons')),
              Switch(
                  value: enabled,
                  onChanged: (bool onChangedValue) {
                    enabled = onChangedValue;
                    setState(() {
                      if (enabled && timesClicked == 0) {
                        msg1 = 'Click Me';
                        msg2 = 'Reset';
                      } else if (enabled && timesClicked > 0) {
                        msg1 = 'Clicked $timesClicked';
                      } else {
                        msg1 = 'Disabled';
                        msg2 = 'Disabled';
                      }
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here
              // as children of the row.
              // For each button use a
              // "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                visible: enabled,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: enabled
                          ? () {
                              setState(() {
                                timesClicked++;
                                msg1 = 'Clicked $timesClicked';
                                print(timesClicked);
                              });
                            }
                          : null,
                      child: Text(msg1)),
                ),
              ),
              Visibility(
                visible: enabled,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: enabled
                          ? () {
                              setState(() {
                                timesClicked = 0;
                                print(timesClicked);
                                msg1 = 'Click Me';
                                print(msg1);
                              });
                            }
                          : null,
                      child: Text(msg2 = 'Reset')),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: textEditingController,
                        //onChanged: (value) => print(value),
                        onFieldSubmitted: (value) =>
                            formKey.currentState!.validate(),
                        validator: (value) {
                          return value!.isEmpty ? 'Min. of 1 char.' : null;
                        },
                        onSaved: (newValue) => firstName = newValue,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.account_circle_rounded),
                            labelText: 'First Name',
                            helperText: 'Min. 1 char. -  Max. 10 char.',
                            suffixIcon: Icon(Icons.check_circle)),
                        maxLength: 10,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                textEditingController.clear();
                                textEditingController.clear();
                                MySnackBar(text: 'Howdy, $firstName!').show();
                                setState(() {});
                              }
                            },
                            child: const Text('Submit')),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
