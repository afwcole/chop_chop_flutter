import 'package:chop_chop_flutter/pages/meal_profile_page.dart';
import 'package:chop_chop_flutter/temp_data/temp_more_choices_lists.dart';
import 'package:flutter/material.dart';

import 'data_model/meal_item.dart';

class DataSearch extends SearchDelegate<String> {
  List<MealItem> _recentSearches = [
    tempMoreChoicesList.mealItems[1],
    tempMoreChoicesList.mealItems[6],
    tempMoreChoicesList.mealItems[3],
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
    final suggestionList =
        query.isEmpty ? _recentSearches : tempMoreChoicesList.mealItems;

    return ListView.builder(
      itemBuilder: (context, index) {
        if (suggestionList[index].name.toLowerCase().contains(query.toLowerCase())) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealProfilePage(
                            mealItem: suggestionList[index],
                          )
                  )
              );
            },
            leading: Icon(Icons.fastfood),
            title: Text(
              suggestionList[index].name,
              style: Theme.of(context).textTheme.display1,
            ),
            subtitle: Text(suggestionList[index].restaurantName),
          );
        } else {
          return Container(
            height: 0,
          );
        }
      },
      itemCount: suggestionList.length,
    );
  }
}
