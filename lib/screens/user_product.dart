import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProduct extends StatelessWidget {
  const UserProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemBuilder: (_, index) => Column(children: [
          UserProductItem(
            productData.items[index].title,
            productData.items[index].imageUrl,),
          Divider()
        ],) ,
          itemCount: productData.items.length,),
      ),
    );
  }
}
