import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import '../widgets/cart_item.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Total ', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),),
                    Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                        onPressed: (){
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.toList(),
                              cart.totalAmount);
                          cart.clear();
                        },
                        child: Text('ORDER NOW',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                    ))
                  ],
                ),
              ),
            ),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(itemBuilder: (ctx, i) =>
            CartItem( cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].title)
            ,
          itemCount: cart.itemCount,
          )

    )
        ],
      ),
    );
  }
}
