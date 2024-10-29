import 'package:flutter/material.dart';

class CarShareTitle extends StatelessWidget {
  final String title;
  const CarShareTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0XFF676767)),
      ),
    );
  }
}