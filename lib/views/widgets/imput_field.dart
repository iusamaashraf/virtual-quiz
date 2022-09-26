import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObsure = false,
    required this.vlaidator,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isObsure;
  final String? Function(String?)? vlaidator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsure,
      validator: vlaidator,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          fillColor: Colors.white70),
    );
  }
}
