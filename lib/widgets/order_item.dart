import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:intl/intl.dart';

class OrderItems extends StatefulWidget {
  final OrderItem order;
  const OrderItems(this.order);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less  : Icons.expand_more ),
                onPressed: (){
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if(_expanded)
              Container(
                height: min(widget.order.products.length * 20.0 +10, 100),
                child: ListView(
                  children:
                    widget.order.products.map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Text(
                          e.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${e.quantity}X  \$${e.price}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        )
                      ],
                    )).toList(),

                ),
              )
          ],
        ),
    );
  }
}
