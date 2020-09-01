import 'package:chop_chop_flutter/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartFAB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      child: Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage()));
      },
    );
  }

}