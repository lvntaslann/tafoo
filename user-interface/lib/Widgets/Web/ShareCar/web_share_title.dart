import 'package:flutter/material.dart';

class WebShareTitle extends StatelessWidget {
  const WebShareTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300),
      child: Text(
        "Kazasız arac",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0XFF676767)),
      ),
    );
  }
}