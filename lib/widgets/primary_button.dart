import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: const Color(0xff252C63),
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
