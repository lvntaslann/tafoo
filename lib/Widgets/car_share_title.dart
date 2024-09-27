import 'package:flutter/material.dart';

class CarShareTitle extends StatelessWidget {
  const CarShareTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        "Sahibinden hatasız araba",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0XFF676767)),
      ),
    );
  }
}