import 'package:flutter/material.dart';

class WebShareCarTitle extends StatelessWidget {
  final String text;
  const WebShareCarTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: text,
              style: TextStyle(
                  color: Color(0XFF898989),
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "*",
              style: TextStyle(
                  color: Color(0XFFFF0000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}