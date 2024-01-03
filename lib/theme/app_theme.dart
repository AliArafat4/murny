import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final Map appThemeMap = {
  "light": ThemeData(
    fontFamily: 'SFArabic',
    dividerColor: Colors.black,
    brightness: Brightness.light,
    primaryColorDark: Color(0xff252C63),
    inputDecorationTheme:
        InputDecorationTheme(filled: true, fillColor: Color(0xffFFFFFF)),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xffFFFFFF)),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Colors.black.withOpacity(0.6)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff62c1c7),
      ),
    ),
    // radioTheme: const RadioThemeData(
    //   fillColor: MaterialStatePropertyAll<Color>(Color(0xff62c1c7)),
    // ),
    segmentedButtonTheme: const SegmentedButtonThemeData(style: ButtonStyle()),
    iconTheme: IconThemeData(
      color: Colors.black.withOpacity(0.8),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: (Color(0xff252C63))),
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
      ),
    ),
    colorScheme: const ColorScheme.light(
      onSecondary: Colors.black,
      secondary: Color(0xff252C63),
      onPrimary: Colors.black,
      background: const Color(0xffFFFFFF),
    ),
    primaryTextTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
  ),
  "dark": ThemeData(
    fontFamily: 'SFArabic',
    brightness: Brightness.dark,
    inputDecorationTheme:
        InputDecorationTheme(filled: true, fillColor: Color(0xff393f44)),
    dividerColor: Colors.white,
    primaryColorDark: Colors.white,
    segmentedButtonTheme: const SegmentedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 172, 19, 19)))),
    colorScheme: const ColorScheme.dark(
        onSecondary: Colors.black,
        secondary: Colors.grey,
        onPrimary: Colors.white),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff62c1c7),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Color(0xffFFFFFF)),
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      dayOverlayColor: MaterialStatePropertyAll<Color>(Color(0xff62c1c7)),
      weekdayStyle: TextStyle(color: Colors.white),
      rangePickerBackgroundColor: Color(0xff62c1c7),
    ),
  ),
};
