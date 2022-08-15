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
        late Map<String, CardItems> _items = {};

        Map<String, CardItems> get items{
          return {..._items};
}

  int get itemCount{
          return  _items.length;
  }

    double get totalAmount {
          var total = 0.0;
          _items.forEach((key, value) {
            total += value.price * value.quantity;
          });
          return total;
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
      notifyListeners();
}

void removeItem (String productId){
          _items.remove(productId);
          notifyListeners();
}

void removeSingleItem(String productId){
          if(!_items.containsKey(productId)){
            return;
          }
          if(_items[productId]!.quantity > 1){
            _items.update(productId, (value) => CardItems(id: value.id, title: value.title, quantity: value.quantity -1, price: value.price));
          } else{
            _items.remove(productId);
          }
          notifyListeners();
}

  void clear(){
          _items = {};
          notifyListeners();
  }

}
