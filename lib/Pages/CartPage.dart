import 'package:chop_chop_flutter/UI_Elements/CartMealTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chop_chop_flutter/Model/meal_item.dart';

import 'HomePage.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String mealName = "Beef Burger";
  String restaurantName = "BBQ City";
  double price = 15.99;
  double subtotal = 49;
  double deliveryFee = 1;
  double total;
  String deliveryLocation = "25B Brunei";

  //Hostel dropdown variables
  var _hostels = ["Brunei (Old)", "Brunei (New)", "Brunei (Complex)",
    "Georgia", "SRC Hostel", "Hall 7", "Tek Credits", "Anglican Hostel"];

  String _currentSelectedItem = "Brunei (Old)";
  String _currentRoomInputted = "25B";
  String _paymentMethod = "Cash";
  bool _walletSelected = false;
  bool _ordersAdded = true;

  var _orders = [
    CartMealTile(mealName: mealItemList.mealItems[1].mealName,
        restaurantName: mealItemList.mealItems[1].restaurantName,
        price: mealItemList.mealItems[1].price,
        qty: 3),
    CartMealTile(mealName: mealItemList.mealItems[2].mealName,
        restaurantName: mealItemList.mealItems[2].restaurantName,
        price: mealItemList.mealItems[2].price,
        qty: 9),
    CartMealTile(mealName: mealItemList.mealItems[3].mealName,
        restaurantName: mealItemList.mealItems[3].restaurantName,
        price: mealItemList.mealItems[3].price,
        qty: 1),
  ];

  void _onDropDownItemSelected(String valueSelected) {
    setState(() {
      this._currentSelectedItem = valueSelected;
    });
  }

  void _onRoomNoSubmitted(String roomInputted) {
    setState(() {
      this._currentRoomInputted = roomInputted;
    });
  }

  @override
  Widget build(BuildContext context) {
    total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/Logo.png", height: 45, width: 45),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: _ordersAdded ? _buildOrderListScreen() : _buildEmptyListScreen(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _ordersAdded ? _checkoutButton() : null,
    );
  }

  Widget _buildEmptyListScreen(){
    return Center(
      child: Text("No Food In Your Cart Yet!"),
    );
  }

  Widget _buildOrderListScreen(){
    return Container(
      color: Colors.white,
      child: ListView(children: <Widget>[
        SizedBox(height: 24),
        title("My", "Order"),
        SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            return _orders[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              indent: 96, endIndent: 104, thickness: 1, height: 0,);
          },
        ),
        SizedBox(height: 24),
        Divider(color: Colors.grey, thickness: 1, indent: 24, endIndent: 24,),
        _feeRow("Subtotal", subtotal, false),
        SizedBox(height: 8),
        _feeRow("Delivery Fee", deliveryFee, false),
        SizedBox(height: 8),
        _feeRow("Total", total, true),
        Divider(
          color: Colors.grey, thickness: 1, indent: 24, endIndent: 24,),
        SizedBox(height: 16),
        _paymentExpansionSection(),
        _deliveryExpansionSection(),
        SizedBox(height: 74,)
      ]),
    );
  }

  Widget _checkoutButton(){
    return Builder(
      builder: (context) => ButtonTheme(
        minWidth: 250,
        child: RaisedButton(
          elevation: 4,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          color: Theme
              .of(context)
              .primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () =>
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: Text("Your Order Has Been Placed!"))),
          child: Text(
            "Checkout",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }

  Widget _feeRow(String amountName, double amount, bool bold) {
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

  Widget _paymentExpansionSection(){
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
          child: Text(_paymentMethod, style: TextStyle(fontSize: 16),)
      ),
      children: <Widget>[
        Container(
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 0),
                title: Text("Cash", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),),
                trailing: Icon(Icons.attach_money),
                selected: !_walletSelected,//if wallet is not selected then cash is selected
                onTap: (){
                  setState(() {
                    this._paymentMethod = "Cash";
                    this._walletSelected = false;
                  });
                },
                dense: true,
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                title: Text("Wallet", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),),
                trailing: Icon(Icons.account_balance_wallet),
                selected: _walletSelected,
                subtitle: Text("\$26.00"),
                onTap: () {
                  setState(() {
                    this._paymentMethod = "Wallet";
                    this._walletSelected = true;
                  });
                },
                dense: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _deliveryExpansionSection(){
    return ExpansionTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              "Deliver To:",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600),),
          ),
        ],
      ),
      title: Center(
          child: Text("$_currentRoomInputted $_currentSelectedItem",
            style: TextStyle(fontSize: 16),)
      ),
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
                      Text("Hostel:", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),),
                      SizedBox(width: 32),
                      DropdownButton<String>(
                        items: _hostels.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String valueSelected) {
                          //Code to execute when menu item is selected from dropdown
                          _onDropDownItemSelected(valueSelected);
                        },
                        value: _currentSelectedItem,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                      )
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(32, 8, 8, 8),
                child: Row(
                  children: <Widget>[
                    Text("Room No:", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),),
                    SizedBox(width: 8),
                    Container(
                      width: 50,
                      child: TextField(
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        onSubmitted: (String roomInputted) {
                          _onRoomNoSubmitted(roomInputted);
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: "123Z"
                        ),
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