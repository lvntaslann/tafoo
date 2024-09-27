import 'package:flutter/material.dart';

class CostValue extends StatelessWidget {
  const CostValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27),
      child: Text(
        "1.500.000 TL",
        style: TextStyle(
            color: Color(0XFFFE7F21),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}