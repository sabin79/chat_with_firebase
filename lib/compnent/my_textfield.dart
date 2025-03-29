import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final bool showSuffixIcon; // New parameter to control suffix visibility
  late bool obscureText;
  final TextEditingController? controller;
  MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.showSuffixIcon = false, // Default to false
    this.obscureText = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: TextFormField(
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
          suffixIcon: widget.showSuffixIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey.shade500,
                  ),
                )
              : null, // No suffix icon when showSuffixIcon is false
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hintText}';
          }
          return null;
        },
      ),
    );
  }
}
