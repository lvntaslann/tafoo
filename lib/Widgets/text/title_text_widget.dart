import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  const TitleTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 47),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: text,
              style: TextStyle(
                  color: Color(0XFF898989),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "*",
              style: TextStyle(
                  color: Color(0XFFFF0000),
                  fontSize: 12,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}