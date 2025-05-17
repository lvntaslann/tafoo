import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const AuthButton({
    super.key,
    required this.size,
    required this.onTap, required this.text,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: Color(0XFF17517D),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}