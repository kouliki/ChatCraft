// import 'package:chat_app/auth/auth_gate.dart';
// import 'package:chat_app/auth/loginorRegister.dart';
// import 'dart:js';

import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/themes/light_mde.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(

    //switching between light mode and dark mode

    ChangeNotifierProvider(
      create: (context)=> ThemeProvider(),
      child:
    const MyApp(),
    )  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        home: AuthGate(),
      // theme: LightMode,
      theme: Provider.of<ThemeProvider>(context).themeData,


    );
  }
}
