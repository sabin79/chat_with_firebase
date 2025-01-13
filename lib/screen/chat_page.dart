import 'package:chat_with_firebase/compnent/chat_bubble.dart';
import 'package:chat_with_firebase/compnent/my_textfield.dart';
import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background, 
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(child: _builduserListItem()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _builduserListItem() {
    String? senderId = _authService.getCurrentUser().uid;
    return StreamBuilder(
      stream: _chatService.getMessages(senderId, receivedId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildMessageItem(doc))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser().uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(
              isCurrentUser: isCurrentUser,
              message: data['message'],
            ),
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,
          )),
          IconButton(
              onPressed: sendMessage,
              icon: Container(
                  height: 35,
                  width: 35,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: Icon(
                    Icons.send,
                    size: 20,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
