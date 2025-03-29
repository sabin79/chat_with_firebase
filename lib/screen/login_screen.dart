import 'dart:ffi';

import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/compnent/my_button.dart';
import 'package:chat_with_firebase/compnent/my_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  Future<void> login(BuildContext context) async {
    // auth service f
    final authService = AuthService();
    // try  login
    try {
      await authService.sigInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
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
              SizedBox(
                height: 16,
              ),
              Text(
                "Welcome  to Login ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 16,
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
              SizedBox(
                height: 16,
              ),
              MyButton(text: "Login", onTap: () async => await login(context)),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Here",
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
