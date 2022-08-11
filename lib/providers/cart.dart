import 'package:flutter/material.dart';

class CardItems{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItems({required this.id,
    required this.title,
    required this.quantity,
    required this.price});
}

class Cart with ChangeNotifier {
        late Map<String, CardItems> _items;

        Map<String, CardItems> get items{
          return {..._items};
}

  int get itemCount{
          return _items == null ? 0 : _items.length;
  }

void addItem(String productId, double price, String title){
          if(_items.containsKey(productId)){
            _items.update(productId,
                    (value) => CardItems(id: value.id,
                        title: value.title,
                        quantity: value.quantity + 1,
                        price: price));
          }else{
            _items.putIfAbsent(productId, () =>
                CardItems(id: DateTime.now().toString(),
                    title: title,
                    quantity: 1,
                    price: price));
          }

}

}
