// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/first-page.dart';
import 'package:robbinlaw/main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(get());
  }

  SnackBar get() {
    return SnackBar(
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Row(
          children: [
            const Icon(
              Icons.favorite,
              color: Color(0xFFEAA4A4),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ),
        action: SnackBarAction(
          textColor: const Color(0xFFFEDBD0),
          label: 'Click Me',
          onPressed: () {
            print('Your name is $firstName.');
          },
        ));
  }
}
