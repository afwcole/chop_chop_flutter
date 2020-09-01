import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

class RestaurantItemList {
  List<RestaurantItem> restaurantItems; // A list of meal item from the class above

  RestaurantItemList({@required this.restaurantItems}); //requires the mealItems list line above
}

class RestaurantItem {
  final int id;
  final String headerImage;
  final String logoImage;
  final String name;
  final String description;
  final int estimatedDeliveryTime;
  final int deliveryFee;
  final List<MealItem> restaurantMenu;
  final String contactNumber;

  RestaurantItem({
    @required this.id,
    @required this.headerImage,
    @required this.logoImage,
    @required this.name,
    @required this.description,
    @required this.estimatedDeliveryTime,
    @required this.deliveryFee,
    this.restaurantMenu,
    this.contactNumber,
  });
}
