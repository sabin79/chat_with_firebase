import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  late bool obscureText;
  final TextEditingController? controller;
  MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = true});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
