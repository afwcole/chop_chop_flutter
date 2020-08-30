import 'package:chop_chop_flutter/Theme.dart';
import 'package:chop_chop_flutter/pages/home_page.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) { return CartProvider(); },
      child: MaterialApp(
        title: 'Chop Chop',
        theme: basicTheme(),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}