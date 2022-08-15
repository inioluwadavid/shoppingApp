import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text('Make Payment'),
          automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/payment');
            },
          ),
          Divider(),
          ListTile(leading: Icon(Icons.edit),
            title: Text('User Product'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/userproduct');
            },
          )
        ],
      ),
    );
  }
}
