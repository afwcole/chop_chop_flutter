import 'package:chop_chop_flutter/pages/screen_elements/buttons/checkout_button.dart';
import 'package:chop_chop_flutter/pages/screen_elements/tiles/cart_meal_tile.dart';
import 'package:chop_chop_flutter/pages/screen_elements/tiles/delivery_expansion_tile.dart';
import 'package:chop_chop_flutter/pages/screen_elements/tiles/payment_expansion_tile.dart';
import 'package:chop_chop_flutter/pages/screen_elements/title.dart';
import 'package:chop_chop_flutter/screens/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);
    double _subtotal = _cartProvider.getSubtotal();
    double _deliveryFee = 1;
    double _total = _subtotal + _deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/Logo.png", height: 45, width: 45),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: _cartProvider.cartList.length == 0
            ? Center(
                child: Text("No Food In Your Cart Yet!"),
              )
            : Container(
                color: Colors.white,
                child: ListView(children: <Widget>[
                  SizedBox(height: 24),
                  title("My", "Order"),
                  SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _cartProvider.cartList.length,
                    itemBuilder: (context, index) {
                      return CartMealTile(
                          cartItem: _cartProvider.cartList[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 96,
                        endIndent: 104,
                        thickness: 1,
                        height: 0,
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                  ),
                  _feeRow(
                      context, "Subtotal", _cartProvider.getSubtotal(), false),
                  SizedBox(height: 8),
                  _feeRow(context, "Delivery Fee", _deliveryFee, false),
                  SizedBox(height: 8),
                  _feeRow(context, "Total", _total, true),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                  ),
                  SizedBox(height: 16),
                  PaymentExpansionTile(),
                  DeliveryExpansionTile(),
                  SizedBox(
                    height: 74,
                  )
                ]),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _cartProvider.cartList.length != 0
          ? CheckoutButton(buttonText: "Place Order")
          : null,
    );
  }

  Widget _feeRow(
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
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: !bold
                ? themeStyle.textTheme.body1
                : themeStyle.textTheme.body1
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
