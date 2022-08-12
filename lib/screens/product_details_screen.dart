import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
   final loadedProduct = Provider.of<Products>(context, listen: false).findBy(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,

              ),
            ),
            SizedBox(height: 10,),
            Text('\$${loadedProduct.price}',
            style: TextStyle(
             color: Colors.grey,
              fontSize: 20,
            ),

            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),

              child: Text(loadedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
              ),
            )
          ],

        ),
      ),
    );
  }
}
