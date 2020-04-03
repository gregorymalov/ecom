
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
     
          Category(
          image_location: 'assets/category/2.png',
          image_caption: 'Пиццы',
        ),
          Category(
          image_location: 'assets/category/3.png',
          image_caption: 'Бургеры',
        ),
          Category(
          image_location: 'assets/category/4.png',
          image_caption: 'Горячее',
        ),
           Category(
          image_location: 'assets/category/1.png',
          image_caption: 'Гарниры',
        ),
            Category(
          image_location: 'assets/category/5.png',
          image_caption: 'Напитки',
        ),
          Category(
          image_location: 'assets/category/6.png',
          image_caption: 'Десерты',
        ),
      
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

Category({
  this.image_caption,
  this.image_location
}
);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(1.0),
    child: InkWell(onTap:(){},
    child: Container(
      width: 90.0,
      height: 90.0,
      child: ListTile(
        title: Image.asset(image_location),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(image_caption)),
      ),
    ),
    
    
    ),

    );
  }
}