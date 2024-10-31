import 'package:flutter/material.dart';

class WebCostValue extends StatelessWidget {
  const WebCostValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Text(
        "1.500.000TL",
        style: TextStyle(
            color: Color(0XFFFE7F21),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}