import 'package:flutter/material.dart';

SnackBar showErrorSnackBar(
  BuildContext context,
  String errorMessage,
) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: const Color(0xffff8080),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return snackBar;
}

void showSuccessSnackBar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
