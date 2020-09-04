import 'package:flutter/material.dart';

class PopArrowButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 10,),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: () {Navigator.of(context).pop();},
        )
    );
  }
}