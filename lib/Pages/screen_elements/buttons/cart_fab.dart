import 'package:chop_chop_flutter/pages/cart_page.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartFAB extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);
    
    return _cartProvider.cartList.length != 0
      ? MaterialButton(
        minWidth: double.infinity,
        height: MediaQuery.of(context).size.height * 0.09,
        padding: EdgeInsets.symmetric(horizontal: 20),
        splashColor: Colors.black12,
        color: Theme
            .of(context)
            .primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.black26,),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("${_cartProvider.cartList.length}", style: Theme.of(context).textTheme.button,),
            ),
            Text("View Cart", style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.w600),),
            Text("\$${_cartProvider.getSubtotal().toStringAsFixed(2)}", style: Theme.of(context).textTheme.button,),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      )
    : Container();
  }

}