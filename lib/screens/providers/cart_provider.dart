import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartList;
  String _selectedPaymentMethod;
  bool _walletSelected;
  String _hostelName;
  String _roomNumber;
  List<String> _hostels;

  CartProvider() {
    _selectedPaymentMethod = "Cash";
    _walletSelected = false;
    _hostelName = "Hall 7";
    _roomNumber = "25B";
    _cartList = [];

    _hostels = [
      "Brunei (Old)",
      "Brunei (New)",
      "Brunei (Complex)",
      "Georgia",
      "SRC Hostel",
      "Hall 7",
      "Tek Credits",
      "Anglican Hostel"
    ];

    loadPreferences();
  }

  //Getters
  String get selectedPaymentMethod => _selectedPaymentMethod;
  bool get walletSelected => _walletSelected;
  String get hostelName => _hostelName;
  String get roomNumber => _roomNumber;
  List<CartItem> get cartList => _cartList;
  List<String> get hostels => _hostels;

  //Setters
  void setPaymentMethod(String paymentMethodSelection, bool walletSelection) {
    _selectedPaymentMethod = paymentMethodSelection;
    _walletSelected = walletSelection;
    notifyListeners();
  }

  void setHostelName(String selectedHostelName) {
    _hostelName = selectedHostelName;
    notifyListeners();
  }

  void setRoomNumber(String roomNumber) {
    _roomNumber = roomNumber;
    notifyListeners();
  }

  void addToCartList(CartItem cartItem) {
    if (safeToAdd(cartItem)) {
      _cartList.add(cartItem);
      notifyListeners();
      savePreferences();
    }
  }

  void removeFromCartList(CartItem cartItem) {
    if (_cartList.contains(cartItem) == true) {
      _cartList.remove(cartItem);
      notifyListeners();
      savePreferences();
    }
  }

  bool safeToAdd(CartItem newCartItem) {
    for (CartItem cartItem in _cartList) {
      if (_sameCartItem(cartItem, newCartItem)) {
        return false;
      }
    }
    return true;
  }

  bool _sameCartItem(CartItem cartItem, CartItem newCartItem) {
    if (cartItem.mealItem.name == newCartItem.mealItem.name) if (cartItem
            .quantity ==
        newCartItem.quantity) if (cartItem
            .totalMealPrice ==
        newCartItem
            .totalMealPrice) if (listEquals(
        cartItem.selectedExtras, newCartItem.selectedExtras)) return true;
    return false;
  }

  double getSubtotal() {
    double subtotal = 0;
    for (var item in _cartList) subtotal += item.totalMealPrice;
    return subtotal;
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Serializes List object into String
    String _encodedCart = CartItem.encodeCartList(_cartList);
    prefs.setString("cartList", _encodedCart);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _encodedCart = prefs.getString("cartList");

    if (_encodedCart != null) {
      //De-serializes into the List Object
      _cartList = CartItem.decodeCartList(_encodedCart);
      notifyListeners();
      savePreferences();
    }
  }
}
