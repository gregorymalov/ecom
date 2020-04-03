import 'package:ecom/services/user.dart';
import 'package:flutter/material.dart';
import 'package:ecom/login.dart';
import 'package:ecom/page1.dart';
import 'package:provider/provider.dart';

// ==============   страница перенаправляющая либо на логин, либо на домашнюю   ==========

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? Page1() : Login();
  }
}
