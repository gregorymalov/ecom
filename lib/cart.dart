import 'package:flutter/material.dart';

import 'components/cart_products.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: InkWell(
        onTap:(){},

    child: Text('КамчЕДАл Delivery'),
      ),
     actions: <Widget>[
       IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
      IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){}),
     ], 
      ),
      body: Cart_products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded (child: ListTile(
            title: Text('Всего'),
            subtitle: Text('\$230'),
          )),
          Expanded(child: MaterialButton(onPressed: (){},
          child: Text('Check out', style: TextStyle(color: Colors.white)),
          color: Colors.green,
          ),),
        ],)
      ),
    );
  }
}