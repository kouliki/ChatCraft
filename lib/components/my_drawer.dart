
import 'package:chat_app/models/help.dart';
import 'package:chat_app/pages/settings._Page.dart';
import 'package:flutter/material.dart';


import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout(){
// get authorize service
    final _auth = AuthService();
    _auth.signOut();


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           children: [
             // logo
             DrawerHeader(
               child: Center(
                 child: Icon(
                   Icons.message,
                   color: Theme.of(context).colorScheme.primary,
                   size: 40,
                 ),
               ),
             ),

             // home list tile
             Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: ListTile(
                 title: Text('H O M E'),
                 leading: Icon(Icons.home),
                 onTap: (){
                   Navigator.pop(context);
                 },
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: ListTile(
                 title: Text('S E T T I N G S'),
                 leading: Icon(Icons.settings),
                 onTap: (){
                   Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>SettingsPage()));
                 },
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: ListTile(
                 title: Text('H E L P'),
                 leading: Icon(Icons.settings),
                 onTap: (){
                   Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>HelpPage()));
                 },
               ),
             ),
           ],
         ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),
            child: ListTile(
              title: Text('L O G O U T'),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),

    );
  }
}
