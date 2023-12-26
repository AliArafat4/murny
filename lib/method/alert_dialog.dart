import 'package:flutter/material.dart';

Future<void> alertDialog(BuildContext context, String title, String subtitle,
    String textButton1, String textButton2) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(
          subtitle,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(textButton1),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text(textButton2),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
