import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondButton extends StatelessWidget {
  SecondButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.color,
      this.isFill = true});
  final Function() onPressed;
  final String title;
  final Color color;
  bool isFill;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height / 18,
        child: ElevatedButton(
          style: isFill
              ? ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // backgroundColor: color,
                  foregroundColor: Colors.white,
                  elevation: 0)
              : ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // side: const BorderSide(color: Color(0xff252C63), width: 1.5),
                  //  foregroundColor: const Color(0xff252C63),
                  elevation: 0),
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ));
  }
}
