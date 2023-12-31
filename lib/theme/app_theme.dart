import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final Map appThemeMap = {
  "light": ThemeData(
    dividerColor: Colors.black,
    brightness: Brightness.light,
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xffFFFFFF)),
    //scaffoldBackgroundColor: const Color.fromARGB(239, 22, 22, 217),
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
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll<Color>(Color(0xff62c1c7)),
    ),
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
        backgroundColor: const Color(0xff62c1c7),
        elevation: 0,
      ),
    ),
    colorScheme: const ColorScheme.light(
      onSecondary: Colors.black,
      secondary: Color(0xff252C63),
      onPrimary: Colors.black,
    ),
    primaryTextTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
  ),
  "dark": ThemeData(
      brightness: Brightness.dark,
      dividerColor: Colors.white,
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
          backgroundColor: const Color(0xff62c1c7),
          elevation: 0,
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
          dayOverlayColor: MaterialStatePropertyAll<Color>(Color(0xff62c1c7)),
          weekdayStyle: TextStyle(color: Colors.white),
          rangePickerBackgroundColor: Color(0xff62c1c7))),
};
