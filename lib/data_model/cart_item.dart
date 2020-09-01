import 'dart:convert';

import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

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

  double getTotalExtrasPrice() {
    double totalPrice = 0;
    for (ExtrasItem extraItem in selectedExtras) {
      totalPrice += extraItem.price;
    }
    return totalPrice;
  }


  //FOR SERIALISATION needed for sharedPreferences of the list
  factory CartItem.fromJson(Map<String, dynamic> jsonData) {
    return CartItem(
      id: jsonData['id'],
      mealItem: MealItem.fromJson(jsonData['mealItem']),
      selectedExtras: ExtrasItem.decodeExtrasList(jsonData['selectedExtras']),
      quantity: jsonData['quantity'],
      totalMealPrice: jsonData['totalMealPrice'],
    );
  }

  static Map<String, dynamic> toMap(CartItem cartItem) =>
      {
        'id': cartItem.id,
        'mealItem': MealItem.toMap(cartItem.mealItem),
        'selectedExtras': ExtrasItem.encodeExtrasList(cartItem.selectedExtras),
        'quantity': cartItem.quantity,
        'totalMealPrice': cartItem.totalMealPrice,
      };

  static String encodeCartList(List<CartItem> cartList) =>
      json.encode(
        cartList
            .map<Map<String, dynamic>>((cartItem) => CartItem.toMap(cartItem))
            .toList(),
      );

  static List<CartItem> decodeCartList(String cartList) =>
      (json.decode(cartList) as List<dynamic>)
          .map<CartItem>((item) => CartItem.fromJson(item))
          .toList();
}