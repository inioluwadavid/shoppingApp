import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrids extends StatelessWidget {
 final bool showFav;

 ProductGrids(this.showFav);

  @override
  Widget build(BuildContext context) {
   final productData = Provider.of<Products>(context);
   final products = showFav ? productData.favoriteItems : productData.items;
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
       value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].imageUrl,
            // products[i].title
        ) ,
      )

      ,
      itemCount: products.length,
    );
  }
}