import 'package:flutter/material.dart';

void navigation({
  required BuildContext context,
  required Widget? screen,
  required String type,
}) {
  switch (type) {
    case "push":
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
      break;

    case "pushRemove":
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => screen!,
          ),
          (route) => false);
      break;

    // case "pop":
    //   Navigator.pop(context);
    //   break;
  }
}
