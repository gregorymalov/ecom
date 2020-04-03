import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id, mail, username;

  User.fromFirebase(FirebaseUser user){
    id = user.uid;
    username = user.displayName;
    mail = user.email;



  }
}