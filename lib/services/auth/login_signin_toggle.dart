import 'package:chat_with_firebase/screen/login_screen.dart';
import 'package:chat_with_firebase/screen/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginSignScreen extends StatefulWidget {
  const LoginSignScreen({super.key});

  @override
  State<LoginSignScreen> createState() => _LoginSignScreenState();
}


class _LoginSignScreenState extends State<LoginSignScreen> {
  bool showLogin = true;

void toggleScreen() {
  setState(() {
    showLogin = !showLogin;
  });
}
  @override
  Widget build(BuildContext context) {
   if (showLogin) {
     return LoginScreen( onTap: toggleScreen,); 

   } else {
     return SignUpScreen(onTap: toggleScreen,);
   }
  }
}