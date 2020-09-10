import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

class MealProfileProvider with ChangeNotifier {
  MealItem _mealItem;
  List<ExtrasItem> _selectedExtras;
  double _totalMealPrice;
  int _quantity;
  double _mealBasePrice;
  double _totalExtrasPrice;

  bool _isEdit;
  int _buttonState = 0;

  MealProfileProvider(){}

  //Getters
  MealItem get mealItem => _mealItem;
  List<ExtrasItem> get selectedExtras => _selectedExtras;
  double get totalMealPrice => _totalMealPrice;
  int get buttonState => _buttonState;
  int get quantity => _quantity;
  bool get isEdit => _isEdit;

  //Setters
  void updateTotalExtrasPrice(bool isChecked, int index){
    if (isChecked)
      _totalExtrasPrice += _mealItem.extrasList[index].price;
    else
      _totalExtrasPrice -= _mealItem.extrasList[index].price;

    _calculateTotalMealPrice();
  }

  void setIsEdit(bool isEdit){
    _isEdit = isEdit;
  }

  void setMealItem(MealItem mealItem){
    _mealItem = mealItem;
    _mealBasePrice = _mealItem.basePrice;
  }

  void setSelectedExtras(List<ExtrasItem> selectedExtras){
    _selectedExtras = selectedExtras;
    notifyListeners();
  }

  void setQuantity(int quantity){
    _quantity = quantity;
    _calculateTotalMealPrice();
    notifyListeners();
  }

  void incrementQty(){
    _quantity++;
    _calculateTotalMealPrice();
    notifyListeners();
  }

  void decrementQty(){
    if (_quantity != 0) {
      _quantity--;
      _calculateTotalMealPrice();
      notifyListeners();
    }
  }

  void setTotalExtrasPrice(double totalExtrasPrice){
    _totalExtrasPrice = totalExtrasPrice;
    _calculateTotalMealPrice();
  }

  void setButtonState(int buttonState){
    _buttonState = buttonState;
    notifyListeners();
  }

  void _calculateTotalMealPrice(){
    _totalMealPrice = (_mealBasePrice + _totalExtrasPrice) * _quantity;
    notifyListeners();
  }
}