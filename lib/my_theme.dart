import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xFFB7935F);
  static Color primaryDark = Color(0xFF141A2E);
  static Color blackColor = Color(0xFF242424);
  static Color whiteColor = Color(0xFFF8F8F8);
  static Color goldenColor = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,

        /// 3shan el labels kolaha tban
        // selectedLabelStyle: ,   3shan aghyr f shakl el label
        backgroundColor: primaryLight),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: blackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      displayLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: goldenColor,
        unselectedItemColor: whiteColor,
        showUnselectedLabels: true,

        /// 3shan el labels kolaha tban
        // selectedLabelStyle: ,   3shan aghyr f shakl el label
        backgroundColor: primaryDark),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: goldenColor,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: goldenColor,
      ),
      displayLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
    ),
  );
}
