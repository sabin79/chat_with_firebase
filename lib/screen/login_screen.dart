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

  void login(BuildContext context) async {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 65,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "Welcome bak to Flutter",
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
            MyButton(text: "Login", onTap: () => login(context)),
            Row(
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Here",
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
