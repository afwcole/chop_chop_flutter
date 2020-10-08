import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  final String firstLine, secondLine;

  BigTitle({Key key, @required this.firstLine, this.secondLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(text: firstLine + "\n",),
            TextSpan(text: secondLine,),
          ]
        ),
      ),
    );
  }
}
