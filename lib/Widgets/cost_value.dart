import 'package:flutter/material.dart';

class CostValue extends StatelessWidget {
  final String cost;
  const CostValue({
    super.key, required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27),
      child: Text(
        cost,
        style: TextStyle(
            color: Color(0XFFFE7F21),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}