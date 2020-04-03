import 'package:ecom/services/authpage.dart';
import 'package:ecom/services/user.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:ecom/auth.dart';
import 'package:provider/provider.dart';

class Ecom extends StatelessWidget {
  const Ecom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.green,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return  StreamProvider<User>.value(
        value: AuthServises().currentUser,
                  child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kamchedal Delivery',
            theme: theme,
            home: LandingPage(),
          ),
        );
      }
    );
  }
}
