import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/compnent/my_button.dart';
import 'package:chat_with_firebase/compnent/my_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  void Function()? onTap;
  SignUpScreen({super.key, required this.onTap});

  void signUp(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.sigUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.toString()),
              );
            });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("password don't match"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
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
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              MyTextField(
                hintText: 'Enter your Name',
                controller: _nameController,
              ),
              MyTextField(
                hintText: 'Enter your Email',
                controller: _emailController,
              ),
              MyTextField(
                hintText: "Enter your Password",
                controller: _passwordController,
                showSuffixIcon: true,
                obscureText: true,
              ),
              MyTextField(
                hintText: "Re-Enter your Password",
                controller: _confirmpasswordController,
                showSuffixIcon: true,
                obscureText: true,
              ),
              SizedBox(
                height: 16,
              ),
              MyButton(text: "Sign Up", onTap: () => signUp(context)),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "login Here",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
