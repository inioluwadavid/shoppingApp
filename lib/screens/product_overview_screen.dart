import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/barge.dart';

import '../widgets/products_grid.dart';

enum filterOptions{
  favorite,
  All
}
class ProductOverviewScreen extends StatefulWidget {


  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnly = false;
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product '),
        actions: [
          PopupMenuButton(
            onSelected: (filterOptions selectedValue){
              setState(() {
                if(selectedValue == filterOptions.favorite){
                  _showOnly = true;
                }else{
                 _showOnly = false;
                }
              });

            },
            icon: Icon(Icons.more_vert),
              itemBuilder: (_) =>[
               PopupMenuItem(child: Text('Only Favorite'), value: filterOptions.favorite,),
                PopupMenuItem(child: Text('Show All'), value: filterOptions.All,),
          ]),
         Consumer<Cart>(builder: (_, cartData, ch) =>
             Badge(child:  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: (){},
                    ),
               value: cartData.itemCount.toString(), color: Colors.amber,
             ),

         )
        ],

      ),
      body: ProductGrids(_showOnly),
    );
  }
}


