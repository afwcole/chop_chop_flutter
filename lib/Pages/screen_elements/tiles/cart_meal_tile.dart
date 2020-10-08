import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:chop_chop_flutter/pages/meal_profile_page.dart';
import 'package:chop_chop_flutter/screens/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CartMealTile extends StatelessWidget {
  final CartItem cartItem;

  CartMealTile({
    @required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);
    double textWidth = MediaQuery.of(context).size.width * 0.35;

    var cartProvider = Provider.of<CartProvider>(context);
    String mealName = cartItem.mealItem.name;
    String restaurantName = cartItem.mealItem.restaurantName;
    double price = cartItem.totalMealPrice;

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.18,
      secondaryActions: <Widget>[
        //Shows icon & actions on sliding the tile left
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Builder(
            builder: (context) => RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealProfilePage(
                            cartItem: cartItem,
                          )),
                );
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: Text("Edit"),
                  duration: Duration(seconds: 1),
                ));
                Slidable.of(context).close();
              },
              elevation: 1.0,
              fillColor: Colors.white30,
              child: Icon(
                Icons.edit,
                size: 20.0,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
          ),
        ),
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Builder(
            builder: (context) => RawMaterialButton(
              onPressed: () {
                Slidable.of(context).close();
                cartProvider.removeFromCartList(cartItem);
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Delete"),
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        return cartProvider.addToCartList(cartItem);
                      },
                    )));
              },
              elevation: 1.0,
              fillColor: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 20.0,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
          ),
        ),
      ],
      child: Container(
        height: 68,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: themeStyle.primaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      "${cartItem.quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .display3
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: textWidth,
                      child: Text(
                        mealName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    Container(
                      width: textWidth,
                      child: Text(restaurantName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .display4
                              .copyWith(color: themeStyle.primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
