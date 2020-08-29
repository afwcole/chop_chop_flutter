import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:flutter/foundation.dart';

class MealItemList {
  List<MealItem> mealItems; // A list of meal item from the class above

  MealItemList({@required this.mealItems});
}

class MealItem {
  final int id;
  final String mealImage;
  final String mealName;
  final double mealBasePrice;
  final String mealDescription;
  final String restaurantName;
  final int estimatedDeliveryTime;
  final int deliveryFee;
  final List<ExtrasItem> extrasList;

  MealItem({
    @required this.id,
    @required this.mealImage,
    @required this.mealName,
    @required this.mealBasePrice,
    @required this.mealDescription,
    this.restaurantName,
    this.estimatedDeliveryTime,
    this.deliveryFee,
    this.extrasList,
  });


  List<String> listExtrasNames() {
    List<String> extrasNames = [];
    if(extrasList == null) return extrasNames;
    for (ExtrasItem extrasItem in extrasList){
      extrasNames.add(extrasItem.extrasName);
    }
    return extrasNames;
  }

}
