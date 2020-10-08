import 'package:chop_chop_flutter/screens/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentExpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);

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
        _cartProvider.selectedPaymentMethod,
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
                selected: !_cartProvider.walletSelected,
                //if wallet is not selected then cash is selected
                onTap: () {
                  _cartProvider.setPaymentMethod("Cash", false);
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
                selected: _cartProvider.walletSelected,
                subtitle: Text("\$26.00"),
                onTap: () {
                  _cartProvider.setPaymentMethod("Wallet", true);
                },
                dense: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
