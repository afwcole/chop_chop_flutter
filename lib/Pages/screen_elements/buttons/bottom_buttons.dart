import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/screens/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatefulWidget {
  final MealItem mealItem;
  final CartItem cartItem;
  final List<ExtrasItem> selectedExtras;
  final double currentMealBasePrice;

  BottomButtons(
      {Key key,
      this.mealItem,
      this.cartItem,
      this.selectedExtras,
      this.currentMealBasePrice})
      : super(key: key);

  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  MealItem _mealItem;
  int _quantity;
  double currentMealPrice;

  @override
  void initState() {
    if (widget.mealItem != null) {
      _mealItem = widget.mealItem;
      _quantity = 1;
    } else {
      _mealItem = widget.cartItem.mealItem;
      _quantity = widget.cartItem.quantity;
    }
    currentMealPrice = widget.currentMealBasePrice * _quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          twoWayButton(context),
          SizedBox(width: 4),
          Expanded(child: addToCartButton(context)),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget twoWayButton(BuildContext context) {
    return Container(
      width: 114,
      padding: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          color: Color(0xFFCCCCCC), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.remove, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity--;
                  }
                });
              }),
          Text(
            "$_quantity",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.black),
          ),
          IconButton(
              icon: Icon(Icons.add, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  _quantity++;
                });
              }),
        ],
      ),
    );
  }

  Widget addToCartButton(BuildContext context) {
    CartProvider _cartProvider = Provider.of<CartProvider>(context);
    bool isEdit = widget.cartItem != null;
    String buttonText = isEdit ? "Update" : "Add";
    currentMealPrice = widget.currentMealBasePrice * _quantity;

    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        CartItem finalCartItem = CartItem(
          mealItem: _mealItem,
          selectedExtras: widget.selectedExtras,
          quantity: _quantity,
          totalMealPrice: currentMealPrice,
        );

        if (_cartProvider.safeToAdd(finalCartItem)) {
          if (isEdit) {
            //removes old cart item from the cart first
            _cartProvider.removeFromCartList(widget.cartItem);
          }

          _cartProvider.addToCartList(finalCartItem);
          Navigator.of(context).pop();
        } else {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: Text("This item is already in the cart!"),
            duration: Duration(milliseconds: 1500),
          ));
        }
      },
      child: Text(
        "$buttonText  \$${currentMealPrice.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}