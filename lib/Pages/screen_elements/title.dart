import 'package:flutter/material.dart';

Widget title(String firstString, String secondWord) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 37),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            firstString,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Color(0xFFA2A2A2),
            ),
          ),
          Text(
            secondWord,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ],
      ),
    ],
  );
}
