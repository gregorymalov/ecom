import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails(
      {this.product_details_name,
      this.product_details_new_price,
      this.product_details_old_price,
      this.product_details_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('КамчЕДАл Delivery'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_details_picture),
              ),
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.product_details_name,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "${widget.product_details_old_price} руб.",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child:
                              Text("${widget.product_details_new_price} руб."),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Row(
            children: <Widget>[

// ==================   Димаметр кнопка    ======================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Диаметр'),
                        content: Text('Выберите диаметр'),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: Text('закрыть'),
                          )
                        ],
                      );
                    }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Диаметр')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

// ==================   Колличество   ======================

   Expanded(
                child: MaterialButton(
                  onPressed: () {

                    showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Колличество'),
                        content: Text('Выберите нужное колличество'),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: Text('закрыть'),
                          )
                        ],
                      );
                    }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Кол-во')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('Купить сейчас'),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                  onPressed: null),
              IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.green),
                  onPressed: null),
            ],
          ),
          Divider(),
          ListTile(
title: Text ('Информация о продукте'),
subtitle: Text('Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.',
style: TextStyle()
),
          ),
          Divider(),
          Row(
            children: <Widget>[
Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
child:  Text("Product name", style: TextStyle(color: Colors.grey),),
),
Padding(padding: const EdgeInsets.all(5.0),
child: Text(widget.product_details_name),
),
            ],
          ),
                 Row(
            children: <Widget>[
Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
child:  Text("Product brand", style: TextStyle(color: Colors.grey),),
),
Padding(padding: const EdgeInsets.all(5.0),
child: Text('МаксПицца'),
),
            ],
          ),

        ],
      ),
    );
  }
}
