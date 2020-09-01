import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:flutter/foundation.dart';

class MealItemList {
  List<MealItem> mealItems; // A list of meal item from the class above

  MealItemList({@required this.mealItems});
}

class MealItem {
  final int id;
  final String image;
  final String name;
  final double basePrice;
  final String description;
  final String restaurantName;
  final List<String> sizes;
  final int estDeliveryTime;
  final int deliveryFee;
  final List<ExtrasItem> extrasList;

  MealItem({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.basePrice,
    @required this.description,
    this.restaurantName,
    this.sizes,
    this.estDeliveryTime,
    this.deliveryFee,
    this.extrasList,
  });


  List<String> listExtrasNames() {
    List<String> extrasNames = [];
    if (extrasList == null) return extrasNames;
    for (ExtrasItem extrasItem in extrasList) {
      extrasNames.add(extrasItem.name);
    }
    return extrasNames;
  }

  //FOR SERIALISATION and DE-SERIALISATION
  factory MealItem.fromJson(Map<String, dynamic> jsonData) {
    return MealItem(
      id: jsonData['id'],
      image: jsonData['image'],
      name: jsonData['name'],
      basePrice: jsonData['basePrice'],
      description: jsonData['description'],
      restaurantName: jsonData['restaurantName'],
      sizes: jsonData['sizes'],
      estDeliveryTime: jsonData['estDeliveryTime'],
      deliveryFee: jsonData['deliveryFee'],
      extrasList: ExtrasItem.decodeExtrasList(jsonData['extrasList']),
    );
  }

  static Map<String, dynamic> toMap(MealItem mealItem) =>
      {
        'id': mealItem.id,
        'image': mealItem.image,
        'name': mealItem.name,
        'basePrice': mealItem.basePrice,
        'description': mealItem.description,
        'restaurantName': mealItem.restaurantName,
        'sizes': mealItem.sizes,
        'estDeliveryTime': mealItem.estDeliveryTime,
        'deliveryFee': mealItem.deliveryFee,
        'extrasList': ExtrasItem.encodeExtrasList(mealItem.extrasList),
      };
}
