import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 45),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'İlan başlığı aracının\n',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
            TextSpan(
              text: 'ön plana',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFE7F21)),
            ),
            TextSpan(
              text: ' çıkmasını\nsağlar.',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
          ],
        ),
      ),
    );
  }
}