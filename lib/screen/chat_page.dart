import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receivedEmail;
  final String receivedId;
   ChatPage({super.key, required this.receivedEmail, required this.receivedId});

final TextEditingController _messageController = TextEditingController();

final ChatService _chatService = ChatService();
final AuthService _authService = AuthService();

void sendMessage() async {
if (_messageController.text.isNotEmpty) {
   await _chatService.sendMessage(receivedId, _messageController.text);
}
 
  _messageController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receivedEmail),
      ),
      body: 
      Column(
        children: [
          Expanded(child: _builduserListItem()),
        ],
      ),
    );

  }
  Widget _builduserListItem() {
     String? senderId = _authService.getCurrentUser().uid;
    return StreamBuilder(
     
      stream: _chatService.getMessage(senderId, receivedId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No users available"));
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _builduserListItem(userData, context))
              .toList(),
        );
      },
    );
  }
}