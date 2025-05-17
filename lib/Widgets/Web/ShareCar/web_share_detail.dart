import 'package:flutter/material.dart';

class WebShareDetail extends StatelessWidget {
  final String title;
  final String result;

  const WebShareDetail({
    super.key,
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      // Use a single row for title and result
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 400),
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0XFFBFBEBE),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 400),
              child: Text(
                result,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0XFF898989),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}