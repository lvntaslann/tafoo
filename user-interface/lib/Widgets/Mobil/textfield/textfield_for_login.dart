import 'package:flutter/material.dart';

class TextFieldForAuth extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool isPassword;

  const TextFieldForAuth({
    super.key,
    required this.text,
    required this.controller, required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Color(0XFFA4A4A4)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Color(0xFFE8E6E6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
