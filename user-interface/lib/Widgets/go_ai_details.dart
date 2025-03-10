import 'package:flutter/material.dart';

class GoAiResult extends StatelessWidget {
  final Function()? onTap;
  const GoAiResult({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Container(
          height: 36,
          width: 363,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0XFFDFDCDC)),
          child: Center(
            child: Text(
              "Yapay zeka hasar tespiti sonucunu gör",
              style: TextStyle(
                  color: Color(0XFF5E5D5D),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}