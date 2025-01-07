import 'package:chat_with_firebase/compnent/my_button.dart';
import 'package:chat_with_firebase/compnent/my_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  void Function()? onTap;
   SignUpScreen({super.key, required this.onTap});

void signUp(){}

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
              size: 65,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "Welcome  to ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            MyTextField(
              hintText: 'Enter your Email',
              controller: _emailController,
            ),
            MyTextField(
              hintText: "Enter your Password",
              controller: _passwordController,
              obscureText: true,
            ),
            MyTextField(
              hintText: "Enter your Password",
              controller: _confirmpasswordController,
              obscureText: true,
            ),
            MyButton(text: "Login", onTap: signUp),
            Row(
              children: [
                Text("Already have an account?"),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "login Here",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
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