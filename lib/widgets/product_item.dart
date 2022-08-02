import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
class ProductItem extends StatelessWidget {
  // final String imageUrl;
  // final String id;
  // final String title;
  //
  // ProductItem(this.id, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed('/productdetailed',
            arguments: product.id
            );
          },
          child: Image.network(product.imageUrl,
          scale: 1.0,
          fit: BoxFit.cover,
      ),
        ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          onPressed: (){
          product.toggleFavoriteStatus();
          },
          icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Theme.of(context).accentColor,
          ),
        ),
        title: Text(product.title,
        textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart,
          color: Theme.of(context).accentColor,
          ),
          onPressed: (){

          },
        ),
      ),
      ),
    );

  }
}
