import 'package:flutter/material.dart';

import 'package:ecom/product_details.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Пипирони",
      "picture": "assets/products/pizza1.jpg",
      "old_price": 890,
      "price": 850,
    },
    {
      "name": "Ветчина",
      "picture": "assets/products/pizza2.jpg",
      "old_price": 820,
      "price": 800,
    },
    {
      "name": "4 сыра",
      "picture": "assets/products/pizza3.jpg",
      "old_price": 799,
      "price": 777,
    },
      {
      "name": "Кола",
      "picture": "assets/products/cola.jpg",
      "old_price": 150,
      "price": 120,
    },
      {
      "name": "Пепси",
      "picture": "assets/products/pepsi.jpg",
      "old_price": 140,
      "price": 120,
    },
      {
      "name": "Чизкейк",
      "picture": "assets/products/chees.jpg",
      "old_price": 250,
      "price": 230,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            product_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.product_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(
              product_details_name: product_name,
              product_details_new_price: prod_price,
              product_details_old_price: prod_old_price,
              product_details_picture: prod_picture,
            ))),
                       child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\ ₽ $prod_price"),
                  subtitle: Text("\ ₽ $prod_old_price",
                  style:  TextStyle(
                    decoration: TextDecoration.lineThrough
                  ),
                  ),
                ),
              ),
              child: Image.asset(prod_picture,
              fit: BoxFit.cover,)),
          ),
        )),
    );
  }
}
