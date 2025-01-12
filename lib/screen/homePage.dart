import 'package:chat_with_firebase/compnent/user_tile.dart';
import 'package:chat_with_firebase/screen/chat_page.dart';
import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/compnent/my_drawer.dart';
import 'package:chat_with_firebase/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //
  final ChatService _chatServices = ChatService();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      drawer: MyDrawerWidget(),
      body: _BuildUserList(),
    );
  }

  Widget _BuildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        print('Snapshot: ${snapshot.data}');
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

  //
  Widget _builduserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      text: userData['email'],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receivedEmail: userData['email'],
              receivedId: userData['uid'],
            ),
          ),
        );
      },
    );
  }
}
