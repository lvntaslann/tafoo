import 'package:flutter/material.dart';

class WebMyShareCarTextWidget extends StatelessWidget {
  const WebMyShareCarTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 95, top: 20),
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
                  color: Color(0xFFFFFFFF)),
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