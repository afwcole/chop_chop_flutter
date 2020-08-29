import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

//TODO Make CartItemList inherit from List or ListBase
// TODO Change the contains method to compare all item deeply.
class CartItemList{

  List<CartItem> cartItems = []; // A list of meal item from the class above

  CartItemList({this.cartItems});

  bool safeToAdd(CartItem newCartItem){
    for (CartItem cartItem in cartItems){
      if(identical(cartItem, newCartItem)){
        return true;
      }
    }
    return false;
  }
}

class CartItem {
  final int id;
  final MealItem mealItem;
  final List<ExtrasItem> selectedExtras;
  final int quantity;
  final double totalMealPrice;

  CartItem({
    this.id,
    @required this.mealItem,
    @required this.selectedExtras,
    @required this.quantity,
    @required this.totalMealPrice,
  });
}