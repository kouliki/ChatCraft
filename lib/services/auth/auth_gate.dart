// import 'package:chat_app/auth/loginorRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/HomePage.dart';
// import '../pages/HomePage.dart';
import 'loginorRegister.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (context,snapshot){
          // user logged in

          if (snapshot.hasData){
            return  HomePage();
          }

          // user is not logged in

          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
