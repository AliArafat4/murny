import 'package:flutter/material.dart';

showLoadingDialog({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      content: SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff62c1c7),
          ),
        ),
      ),
    ),
  );
}
