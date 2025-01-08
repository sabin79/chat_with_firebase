import 'package:chat_with_firebase/services/auth/login_signin_toggle.dart';
import 'package:chat_with_firebase/services/auth/auth_gate.dart';
import 'package:chat_with_firebase/screen/login_screen.dart';
import 'package:chat_with_firebase/firebase_options.dart';
import 'package:chat_with_firebase/theme/light_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 80);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: AuthGate(),
    );
  }
}
