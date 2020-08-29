import 'package:flutter/foundation.dart';

class MealHelper {
  double _totalMealPrice;
  double _oneMealPrice;
  int _quantity = 1;
  final double mealBasePrice;
  double _totalExtrasPrice = 0;

  MealHelper({
    @required this.mealBasePrice,
  });

  //Setters
  void setTotalMealPrice() {
    _oneMealPrice = mealBasePrice + _totalExtrasPrice;
    _totalMealPrice = _oneMealPrice * _quantity;
  }

  //Getters
  double get totalMealPrice => _totalMealPrice;

  int get quantity => _quantity;

  void addExtrasPrice(double extrasPrice) {
    _totalExtrasPrice += extrasPrice;
    setTotalMealPrice();
  }

  void subExtrasPrice(double extrasPrice) {
    _totalExtrasPrice -= extrasPrice;
    setTotalMealPrice();
  }

  void incrementQuantity() {
    _quantity++;
    setTotalMealPrice();
  }

  void decrementQuantity() {
    if (_quantity != 0) {
      _quantity--;
      setTotalMealPrice();
    }
  }
}