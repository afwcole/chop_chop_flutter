import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';

final String _mealDescription =
    "Short description, 280 character limit, describing the meal and all the ingredients involved. Opportunity to convey a message to customers and sell the product";

MealItemList tempTopChoicesList = MealItemList(mealItems: [
  MealItem(
      id: 2,
      mealName: "Gretaben",
      restaurantName: "PizzaMan",
      mealBasePrice: 45.00,
      mealImage: 'images/Noodles.jpg',
      mealDescription: _mealDescription,
      estimatedDeliveryTime: 30,
      deliveryFee: 2,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Kelewele",
          extrasPrice: 3,
        ),
      ]),
  MealItem(
      id: 5,
      mealName: "Krabby Patty",
      restaurantName: "Husband and Wife",
      mealBasePrice: 16.00,
      mealImage: 'images/Burger.jpg',
      mealDescription: _mealDescription,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Kelewele",
          extrasPrice: 3,
        ),
      ]),
  MealItem(
      id: 4,
      mealName: "Jollof with Beef",
      restaurantName: "Sweet Mummy's",
      mealBasePrice: 16.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Water",
          extrasPrice: 0,
        ),
      ]),
  MealItem(
      id: 1,
      mealName: "Beef Burger",
      restaurantName: "BBQ City",
      mealBasePrice: 15.00,
      mealImage: 'images/Burger.jpg',
      mealDescription: _mealDescription,
      estimatedDeliveryTime: 35,
      deliveryFee: 1,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Water",
          extrasPrice: 0,
        ),
      ]),
  MealItem(
      id: 3,
      mealName: "Banku & Tilapia",
      restaurantName: "Sanbra",
      mealBasePrice: 13.00,
      mealImage: 'images/Local.jpg',
      mealDescription: _mealDescription,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Water",
          extrasPrice: 0,
        ),
      ]),
]);