import 'package:chop_chop_flutter/Model/meal_item.dart';
import 'package:chop_chop_flutter/UI_Elements/CardTypes.dart';
import 'package:chop_chop_flutter/UI_Elements/Decks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset( "images/Logo.png", height: 45, width: 45),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
        ]
      ),
      drawer: standardDrawer(context),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 24),
              title("Let's", "Chop"),
              SizedBox(height: 24),
              CategoryDeck(),
              SizedBox(height: 26),
              RestaurantCardDeck(deckTitle: "Restaurants"),
              SizedBox(height: 26),
              MealDeck(),
              SizedBox(height: 26),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text("More Choices", style: themeStyle.textTheme.subhead),),
              SizedBox(height: 18),
              Container(
                child: Column(
                  children: <Widget>[
                    for(var mealItem in mealItemList.mealItems)
                      ColumnCard(
                        imageUrl: mealItem.imgUrl,
                        restaurantName: mealItem.restaurantName,
                        mealName: mealItem.mealName,
                        price: mealItem.price,
                      ),
                  ],
                ),
              )
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).pushNamed('/CartPage');},
        child: Icon(Icons.shopping_cart),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }
}


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
      itemBuilder: (context, index){
        if(suggestionList[index].mealName.contains(query)){
          return ListTile(
            onTap: () {Navigator.of(context).pushNamed('/MealProfilePage');},
            leading: Icon(Icons.fastfood),
            title: Text(
              suggestionList[index].mealName,
              style: Theme.of(context).textTheme.display1,
            ),
            subtitle: Text(suggestionList[index].restaurantName),);
        }
        else{
          return Container(height: 0,);
        }
      },
      itemCount: suggestionList.length,
    );
  }
}


Widget title(String firstString, String secondWord) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 37),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(firstString,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Color(0xFFA2A2A2),
            ),
          ),
          Text(secondWord,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30,),),
        ],
      ),
    ],
  );
}


Widget standardDrawer(BuildContext context){
  return SafeArea(
    child: Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Theme
                    .of(context)
                    .primaryColor),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Kofi Tsikita",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                      SizedBox(height: 4,),
                      Text("+233205765286",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black54,),),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black87,),
              title: Text("Account", style: Theme.of(context).textTheme.subtitle),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.local_dining, color: Colors.black87,),
              title: Text("Orders", style: Theme.of(context).textTheme.subtitle),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet, color: Colors.black87,),
              title: Text("Wallet", style: Theme.of(context).textTheme.subtitle),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black87,),
              title: Text("Settings", style: Theme.of(context).textTheme.subtitle),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.black87,),
              title: Text("Help", style: Theme.of(context).textTheme.subtitle),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}