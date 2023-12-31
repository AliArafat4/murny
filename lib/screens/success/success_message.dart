import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontSize: 22,
      ),
    );
  }
}
