
import 'dart:ffi';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({required this.id,
            required this.title,
            required this.description,
            required this.imageUrl,
            required this.price,
            this.isFavorite= false});
}