import 'package:chop_chop_flutter/screen_elements/cart_meal_tile.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:chop_chop_flutter/screen_elements/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/Logo.png", height: 45, width: 45),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: cartProvider.cartList.length != 0
            ? _buildCartListScreen(context)
            : _buildEmptyCartListScreen(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          cartProvider.cartList.length != 0 ? _checkoutButton() : null,
    );
  }

  Widget _buildEmptyCartListScreen() {
    return Center(
      child: Text("No Food In Your Cart Yet!"),
    );
  }

  Widget _buildCartListScreen(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    double subtotal = cartProvider.getSubtotal();
    double deliveryFee = 1;
    double total = subtotal + deliveryFee;

    return Container(
      color: Colors.white,
      child: ListView(children: <Widget>[
        SizedBox(height: 24),
        title("My", "Order"),
        SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: cartProvider.cartList.length,
          itemBuilder: (context, index) {
            return CartMealTile(mealItem: cartProvider.cartList[index]);
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
        _feeRow(context, "Subtotal", cartProvider.getSubtotal(), false),
        SizedBox(height: 8),
        _feeRow(context, "Delivery Fee", deliveryFee, false),
        SizedBox(height: 8),
        _feeRow(context, "Total", total, true),
        Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 24,
          endIndent: 24,
        ),
        SizedBox(height: 16),
        _paymentExpansionSection(context),
        _deliveryExpansionSection(context),
        SizedBox(
          height: 74,
        )
      ]),
    );
  }

  Widget _checkoutButton() {
    return Builder(
      builder: (context) => ButtonTheme(
        minWidth: 250,
        child: RaisedButton(
          elevation: 4,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () => Scaffold.of(context).showSnackBar(
              new SnackBar(content: Text("Your Order Has Been Placed!"))),
          child: Text(
            "Checkout",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }

  Widget _feeRow(BuildContext context, String amountName, double amount, bool bold) {
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

  Widget _paymentExpansionSection(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return ExpansionTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              "Payment Method:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      title: Center(
          child: Text(
        cartProvider.selectedPaymentMethod,
        style: TextStyle(fontSize: 16),
      )),
      children: <Widget>[
        Container(
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 0),
                title: Text(
                  "Cash",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                trailing: Icon(Icons.attach_money),
                selected: !cartProvider.walletSelected,
                //if wallet is not selected then cash is selected
                onTap: () {
                  cartProvider.setPaymentMethod("Cash", false);
                },
                dense: true,
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                title: Text(
                  "Wallet",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                trailing: Icon(Icons.account_balance_wallet),
                selected: cartProvider.walletSelected,
                subtitle: Text("\$26.00"),
                onTap: () {
                  cartProvider.setPaymentMethod("Wallet", true);
                },
                dense: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _deliveryExpansionSection(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return ExpansionTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              "Deliver To:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      title: Center(
          child: Text(
        "${cartProvider.roomNumber} ${cartProvider.hostelName}",
        style: TextStyle(fontSize: 16),
      )),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(32, 6, 6, 4),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hostel:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(width: 32),
                      DropdownButton<String>(
                        value: cartProvider.hostelName,
                        onChanged: (String value) {
                          cartProvider.setHostelName(value);
                        },
                        items: cartProvider.hostels.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(32, 8, 8, 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Room No:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 50,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        onSubmitted: (String roomNumber) {
                          cartProvider.setRoomNumber(roomNumber);
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: cartProvider.roomNumber,
                            hintStyle: TextStyle(color: Colors.black)),
                        textCapitalization: TextCapitalization.characters,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
