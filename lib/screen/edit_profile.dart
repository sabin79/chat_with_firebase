import 'package:chat_with_firebase/compnent/my_textfield.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Column(children: [
          Icon(
            Icons.message,
            size: 65,
            color: Theme.of(context).colorScheme.primary,
          ),
          MyTextField(
            controller: _nameController,
            hintText: 'Enter your Name',
          ),
          MyTextField(
            controller: _emailController,
            hintText: 'Enter your Email',
          ),
        ]));
  }
}
