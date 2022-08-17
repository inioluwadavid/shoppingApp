
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  UserProductItem(this.id, this.title,  this.imageUrl);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8,
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pushNamed('/editproduct', arguments: id);
              }, icon:  Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              )),
              IconButton(onPressed: (){

              }, icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
