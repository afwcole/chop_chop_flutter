import 'package:flutter/material.dart';

ThemeData basicTheme() {

  final FontWeight _bold = FontWeight.w700;
  final FontWeight _semiBold = FontWeight.w600;
  final FontWeight _regular = FontWeight.w400;

  AppBarTheme _basicAppBarTheme(AppBarTheme base) {
    return base.copyWith(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black
      )
    );
  }

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline: TextStyle(
          fontSize: 25.0, fontWeight: _bold, color: Colors.black),
      subhead: TextStyle(
          fontSize: 18.0, fontWeight: _bold, color: Colors.black),
      title: TextStyle(
          fontSize: 20.0, fontWeight: _semiBold, color: Colors.black),
      subtitle: TextStyle(
          fontSize: 16.0, fontWeight: _semiBold, color: Colors.black),
      body1: TextStyle(
          fontSize: 14.0, fontWeight: _regular, color: Colors.black),
      display1: TextStyle(
          fontSize: 16.0, fontWeight: _bold, color: Colors.black),
      display2: TextStyle(
          fontSize: 12.0, fontWeight: _semiBold, color: Colors.black),
      display3: TextStyle(
          fontSize: 18.0, fontWeight: _semiBold, color: Colors.black),
      display4: TextStyle(
          fontSize: 14.0, fontWeight: _semiBold, color: Color(0xFF707070)),
      button: TextStyle(
          fontSize: 16.0, fontWeight: _regular, color: Colors.white),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    appBarTheme: _basicAppBarTheme(base.appBarTheme),
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Color(0xFFE2993A),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent, elevation: 20)
  );
}

