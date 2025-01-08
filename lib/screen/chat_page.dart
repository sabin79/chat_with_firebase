import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receivedEmail;
  const ChatPage({super.key, required this.receivedEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receivedEmail),
      ),
    );

  }
}