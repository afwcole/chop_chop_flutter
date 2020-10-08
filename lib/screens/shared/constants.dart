import 'package:flutter/material.dart';
const borderRadius = BorderRadius.all(Radius.circular(10));

const textInputDecoration = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  enabledBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 3.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Color(0xFFFFBB00), width: 3.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Colors.red, width: 3.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Color(0xFFFFBB00), width: 3.0),
  ),
);