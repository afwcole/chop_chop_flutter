import 'package:flutter/material.dart';

class PopArrowButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {Navigator.of(context).pop();},
        )
    );
  }
}