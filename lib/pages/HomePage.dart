
// import 'dart:js';

import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chats/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

// chat and auth services
  final ChatService _chatService=ChatService();
  final AuthService _authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: Text("Home page",style: GoogleFonts.arima(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueGrey,
        elevation: 0,
        // logout button 
        
        // actions: [
        //   // IconButton(onPressed: logout,
        //   //     icon: Icon(Icons.login_outlined)
        //   // )
        // ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context,snapshot) {
          // error
          if (snapshot.hasError){
            return Text("Error");
          }

          //loading
          if (snapshot.connectionState==ConnectionState.waiting){
            return Text("Loading..");
          }
          // list view
          return ListView(
            children: snapshot.data!.map<Widget>((userData)=> _buildUserListItem(userData,context)).toList(),
          );

        }
    );
}

// build individual List file for user

Widget _buildUserListItem(
    Map<String,dynamic> userData, BuildContext context){
    // display all users except current user
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: (){
          // tapped when the user move to the chat page
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData["uid"],
          ),
          ));
        },
      );
    }
    else{
      return Container();
    }
}

}
