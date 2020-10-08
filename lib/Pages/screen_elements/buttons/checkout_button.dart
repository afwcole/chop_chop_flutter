import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final String buttonText;

  CheckoutButton({this.buttonText});

  @override
  Widget build(BuildContext context) {
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
            buttonText,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
