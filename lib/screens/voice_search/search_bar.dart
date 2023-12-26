import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  searchBar({super.key, required this.hint, required this.controller});

  final String hint;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xffCDCED3))),
      controller: controller,
    );
  }
}
