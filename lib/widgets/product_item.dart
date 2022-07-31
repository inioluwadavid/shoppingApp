import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String id;
  final String title;

  ProductItem(this.id, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return GridTile(child: Image.network(imageUrl));
  }
}
