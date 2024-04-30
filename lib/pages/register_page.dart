
import 'package:chat_app/components/my_buttons.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    // email, password and confirm password text editing controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _pwController = TextEditingController();
    TextEditingController _conform_pwController = TextEditingController();

    // Register funtion
    void register(BuildContext context) async{
      // Auth service
      final authService = AuthService();

      // if Password and confirm password matches
      if(_pwController.text == _conform_pwController.text) {
        try {
          await authService.signUpWithEmailPassword(
              _emailController.text, _pwController.text);
        }
        catch (e) {
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text(e.toString()),
                  )
          );
        }
      }else{
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: Text('Password don\'t match'),
                )
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            // Welcome back message
            Text(
              "Let's create an account for you!!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Email Textfield
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            // Password Textfield
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(
              height: 10,
            ),

            // Confirm Password Textfield
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _conform_pwController,
            ),

            const SizedBox(
              height: 25,
            ),

            // Login button
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 25,
            ),

            // Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: tdBlue
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
