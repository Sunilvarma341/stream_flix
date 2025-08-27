import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    super.key,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.hintText,
    this.labelText,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration:  InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter text',
        focusColor: Colors.blue,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      validator: validator,
    );
  }
}
