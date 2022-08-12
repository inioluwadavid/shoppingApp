import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/order_screen.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
            create: (ctx) => Orders()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.blue,
        ),

        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          '/productdetailed': (ctx) => ProductDetailsScreen(),
          '/cart': (ctx) => CartScreen(),
          '/payment' : (ctx) => OrderScreen()
        },
      ),
    );
  }
}




