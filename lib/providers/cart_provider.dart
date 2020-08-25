import 'package:chop_chop_flutter/Model/meal_item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<MealItem> _cartList;
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
    _cartList = [
      mealItemList.mealItems[1],
      mealItemList.mealItems[2],
      mealItemList.mealItems[3],
    ];
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
  }

  //Getters
  String get selectedPaymentMethod => _selectedPaymentMethod;
  bool get walletSelected => _walletSelected;
  String get hostelName => _hostelName;
  String get roomNumber => _roomNumber;
  List<MealItem> get cartList => _cartList;
  List<String> get hostels => _hostels;

  //Setters
  void setPaymentMethod(String paymentMethodSelection, bool walletSelection) {
    _selectedPaymentMethod = paymentMethodSelection;
    _walletSelected = walletSelection;
    notifyListeners();
  }

  void setHostelName(String selectedHostelName){
    _hostelName = selectedHostelName;
    notifyListeners();
  }

  void setRoomNumber(String roomNumber) {
    _roomNumber = roomNumber;
    notifyListeners();
  }

  void addToCartList(MealItem mealItem){
    if(_cartList.contains(mealItem) == false){
      _cartList.add(mealItem);
      notifyListeners();
    }
  }

  void removeFromCartList(MealItem mealItem) {
    if (_cartList.contains(mealItem) == true) {
      _cartList.remove(mealItem);
      notifyListeners();
    }
  }

  double getSubtotal(){
    double subtotal = 0;
    for (var item in _cartList) subtotal += item.price;
    return subtotal;
  }
}
