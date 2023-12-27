import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/arrow_back.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 28),
    ),
    leading: const ArrowBack(),
  );
}
