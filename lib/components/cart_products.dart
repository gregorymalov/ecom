import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Пипирони",
      "picture": "assets/products/pizza1.jpg",
      "price": "850",
      "size": "35см",
      "quantity": "1",
    },
    {
      "name": "Ветчина",
      "picture": "assets/products/pizza2.jpg",
      "price": "800",
      "size": "35см",
      "quantity": "1",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_product_name: Products_on_the_cart[index]["name"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_product_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture, width: 100.0, height: 100),
        title: Text(cart_product_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cart_prod_size),
                ),
                  Padding(padding: const EdgeInsets.all(8.0),
                 child: Text("Кол-во:"),
                 ),
                  Padding(padding: const EdgeInsets.all(8.0),
                     child: Text(cart_prod_qty),),
              ],
            ),
            // =================      Цена      =================
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "${cart_prod_price} руб.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        trailing: Column(
   mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          SizedBox (
            height: 18.0,
            width: 18.0,

            child: IconButton(
            
 iconSize: 22.0,
              icon: Icon(
                Icons.arrow_drop_up,
              
                ), onPressed: (){},
                
                

alignment: Alignment.topCenter,
padding: const EdgeInsets.all(0.0),

              ), ),
//Text(cart_prod_qty),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox (
            height: 18.0,
            width: 18.0,

            child: IconButton(
            
 iconSize: 22.0,
              icon: Icon(
                Icons.arrow_drop_down,
              
                ), onPressed: (){},
                
                

alignment: Alignment.topCenter,
padding: const EdgeInsets.all(0.0),

              ), ),
                  ),
              
         
          ],
        ),
      ),
    );
  }
}

void addQuantity(){
  
}
