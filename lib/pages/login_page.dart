// import 'dart:js';


import 'package:chat_app/components/my_buttons.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {

  // emain and pw text controllers
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key,required this.onTap});

  // login method

  void login(BuildContext context) async{
    // auth service

    final authService=AuthService();

    // try login
    try{
      await authService.signInWithEmailPassword(_emailcontroller.text,_pwcontroller.text);
    }

    // catch any errors

    catch (e){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 50,),
            Text("welcome back,you've been missed!",style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,

            ),),
          SizedBox(height: 25,),

          // email textfield
          MyTextField(hintText: 'email',obscureText:false ,controller:_emailcontroller ,),
            SizedBox(height: 25,),
      MyTextField(
        hintText: 'password',
        obscureText: true,
        controller: _pwcontroller,
      ),
            SizedBox(height: 25,),

             // login button
            MyButton(
              text: "Login",
              onTap: ()=>login(context),
            ),


            // register now

            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member ?,',style: GoogleFonts.amethysta(

                  color: Theme.of(context).colorScheme.primary,
                ),),

                GestureDetector(
                  onTap: onTap,

                  child: Text('Register Now',style: GoogleFonts.amethysta(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),),
                ),
              ],
            )
            




          ],
        ),
      ),
    );
  }
}
