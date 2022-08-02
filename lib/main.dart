import 'package:flutter/material.dart';
import 'package:shop/screens/product_details_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'providers/products_provider.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.blue,
        ),
        home:  ProductOverviewScreen(),
        routes: {
          '/productdetailed': (ctx) => ProductDetailsScreen()
        },
      ),
    );
  }
}




