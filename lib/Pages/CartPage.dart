import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    String mealName = "Beef Burger";
    String restaurantName = "BBQ City";
    double price = 15.99;
    double subtotal = 49.99;
    double deliveryFee = 1;
    double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/Logo.png", height: 45, width: 45),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          ListView(children: <Widget>[
            SizedBox(height: 24),
            title("My", "Order"),
            SizedBox(height: 11),
            cartMealTile(context, mealName, restaurantName, price, 5),
            cartMealTile(context, mealName, restaurantName, price, 3),
            cartMealTile(context, mealName, restaurantName, price, 1),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 24,
              endIndent: 24,
            ),
            feeRow(context, "Subtotal", subtotal, false),
            SizedBox(height: 8),
            feeRow(context, "Delivery Fee", deliveryFee, false),
            SizedBox(height: 8),
            feeRow(context, "Total", total, true),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 24,
              endIndent: 24,
            ),
            SizedBox(height: 74)
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 37),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                color: Theme
                    .of(context)
                    .primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {},
                child: Text(
                  "Checkout",
                  style: Theme
                      .of(context)
                      .textTheme
                      .button,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget cartMealTile(BuildContext context, String mealName,
    String restaurantName, double price, int qty) {
  final ThemeData themeStyle = Theme.of(context);
  double textWidth = MediaQuery.of(context).size.width * 0.35;

  return Container(
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
                  "$qty",
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
            "\$$price",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
      ],
    ),
  );
}

Widget feeRow(
    BuildContext context, String amountName, double amount, bool bold) {
  final ThemeData themeStyle = Theme.of(context);

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 37),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          amountName,
          style: !bold
              ? themeStyle.textTheme.body1
              : themeStyle.textTheme.body1
                  .copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          "\$$amount",
          style: !bold
              ? themeStyle.textTheme.body1
              : themeStyle.textTheme.body1
                  .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
