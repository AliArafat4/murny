import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/arrow_back.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22),
      ),
    ),
    leading: const ArrowBack(),
  );
}
