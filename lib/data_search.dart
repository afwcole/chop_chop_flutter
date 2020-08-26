import 'package:flutter/material.dart';

import 'data_model/meal_item.dart';

class DataSearch extends SearchDelegate<String> {

  final recentSearches = [
    mealItemList.mealItems[1],
    mealItemList.mealItems[6],
    mealItemList.mealItems[3],
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show results based on selection
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when user searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : mealItemList.mealItems;

    return ListView.builder(
      itemBuilder: (context, index) {
        if (suggestionList[index].mealName.contains(query)) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/MealProfilePage');
            },
            leading: Icon(Icons.fastfood),
            title: Text(
              suggestionList[index].mealName,
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            subtitle: Text(suggestionList[index].restaurantName),);
        }
        else {
          return Container(height: 0,);
        }
      },
      itemCount: suggestionList.length,
    );
  }
}