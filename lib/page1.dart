import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/cart.dart';
import 'package:ecom/services/authpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'components/horizontal_listview.dart';
import 'components/products.dart';
import 'package:ecom/login.dart';
import 'package:ecom/services/user.dart';


//  ╔╗╔═╗╔═══╗╔═╗╔═╗╔═══╗╔╗─╔╗╔═══╗╔═══╗╔═══╗╔╗───     ╔═══╗╔═══╗╔╗───╔══╗╔╗──╔╗╔═══╗╔═══╗╔╗──╔╗
//  ║║║╔╝║╔═╗║║║╚╝║║║╔═╗║║║─║║║╔══╝╚╗╔╗║║╔═╗║║║───     ╚╗╔╗║║╔══╝║║───╚╣─╝║╚╗╔╝║║╔══╝║╔═╗║║╚╗╔╝║
//  ║╚╝╝─║║─║║║╔╗╔╗║║║─╚╝║╚═╝║║╚══╗─║║║║║║─║║║║───     ─║║║║║╚══╗║║────║║─╚╗║║╔╝║╚══╗║╚═╝║╚╗╚╝╔╝
//  ║╔╗║─║╚═╝║║║║║║║║║─╔╗║╔═╗║║╔══╝─║║║║║╚═╝║║║─╔╗     ─║║║║║╔══╝║║─╔╗─║║──║╚╝║─║╔══╝║╔╗╔╝─╚╗╔╝─
//  ║║║╚╗║╔═╗║║║║║║║║╚═╝║║║─║║║╚══╗╔╝╚╝║║╔═╗║║╚═╝║     ╔╝╚╝║║╚══╗║╚═╝║╔╣─╗─╚╗╔╝─║╚══╗║║║╚╗──║║──
//  ╚╝╚═╝╚╝─╚╝╚╝╚╝╚╝╚═══╝╚╝─╚╝╚═══╝╚═══╝╚╝─╚╝╚═══╝     ╚═══╝╚═══╝╚═══╝╚══╝──╚╝──╚═══╝╚╝╚═╝──╚╝──


class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>{
  //String _db;

/* Future<String> email() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String email = user.email.toString();
  } */

final _db = Firestore.instance.collection('users');
//final Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();


  Brightness brightness; 
  bool _isSwitched = true;
  List<Color> _colors = [
    Colors.red,
    Colors.pink,
    Colors.teal,
  ];
  int _currentIndex = 1;
  _onChanged() {
    int _colorCount = _colors.length;
    setState(() {
      if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex += 1;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/burger.jpg'),
          AssetImage('assets/free.jpg'),
          AssetImage('assets/pasta.jpg'),

        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        indicatorBgPadding: 5.0,
      )
    );
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
     //     FlatButton.icon(onPressed: (){}, icon: Icons(Icons.supervised_user_circle, color: Colors.white), child: SizedBox.shrink()),
      
          UserAccountsDrawerHeader(
            accountName: FutureBuilder(
              
              future: username(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) { 
           
              return Text(snapshot.data.toString());
            
            }),
            accountEmail: FutureBuilder(
              
              future: mail(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) { 
           
              return Text(snapshot.data.toString());
            
            }),
            
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(backgroundImage: AssetImage("assets/logogregory.png"),)
          ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          
          
          ),
     
        InkWell(
          onTap: ()async{
        
            final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String email = user.uid;
/*     
  databaseReference
      .collection("users")
  
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  }); */

            
            print(email);
          },

          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Мой профиль'),
          ),
        ),

        InkWell(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          },

          child: 
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Корзина'),
          ),
        ),


            InkWell(
          onTap: (){},

          child: 
             ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Избранное'),
          ),
            ),
            Divider(),


                InkWell(
          onTap: (){},

          child: 
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
          ), ),


              InkWell(
          onTap: (){AuthServises().logOut();},

               child: 
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выход'),
          ), ),
              InkWell(
          onTap: (){},

          child: 
          ListTile(
            leading: GFToggle(
              onChanged: (val) {
                DynamicTheme.of(context).setBrightness(
                    Theme.of(context).brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark);
              },
             // value: brightness,
              type: GFToggleType.ios,
            ),
            title: Text('Смена темы'),
          ),),
        ],
      )),
      // backgroundColor: Colors.black26,
      appBar: AppBar(title: InkWell(
        onTap:(){},

    child: Text('КамчЕДАл Delivery'),
      ),
     actions: <Widget>[
      IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
      IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
      }),
     ], 
      ),
      body: Column(
        children: <Widget>[
          image_carousel,
          Padding(padding: const EdgeInsets.all(8.0),
          
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text('Категории')
            
            ),
            
            ),

          HorizontalList(),

           Padding(padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text('Витрина')),),

        Flexible(child: Products()),
          
         
        ],
      ),
    );
  }
}

 Future<String>   mail() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String email = user.email.toString();
  return  email;
  } 

   Future<String>   username() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String who = user.uid.toString();
   // final DocumentReference gg = Firestore.instance.document(who);
  return  who;
  } 


