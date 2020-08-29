import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

class RestaurantItemList {
  List<RestaurantItem> restaurantItems; // A list of meal item from the class above

  RestaurantItemList({@required this.restaurantItems}); //requires the mealItems list line above
}

class RestaurantItem {
  final int id;
  final String restaurantHeaderImage;
  final String restaurantLogo;
  final String restaurantName;
  final String restaurantDescription;
  final int estimatedDeliveryTime;
  final int deliveryFee;
  List<MealItem> restaurantMenu;
  String restaurantContactNumber;

  RestaurantItem({
    @required this.id,
    @required this.restaurantHeaderImage,
    @required this.restaurantLogo,
    @required this.restaurantName,
    @required this.restaurantDescription,
    @required this.estimatedDeliveryTime,
    @required this.deliveryFee,
    this.restaurantMenu,
    this.restaurantContactNumber,
  });
}
