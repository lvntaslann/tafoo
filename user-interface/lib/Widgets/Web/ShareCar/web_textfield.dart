import 'package:flutter/material.dart';

class WebTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const WebTextField({
    super.key,
    required this.text, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: Container(
        width: 400,
        height: 45,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Color(0xFFE8E6E6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}