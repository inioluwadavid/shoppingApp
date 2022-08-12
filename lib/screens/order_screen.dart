import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_item.dart';
import '../providers/orders.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemBuilder:(ctx, i) =>OrderItems(ordersData.orders[i]) ,
            itemCount: ordersData.orders.length,
      ),
    );
  }
}
