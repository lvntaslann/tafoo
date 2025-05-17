import 'package:flutter/material.dart';

class web_add_image_text_widget extends StatelessWidget {
  const web_add_image_text_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 450),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Son adım aracının\n',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
            TextSpan(
              text: 'görsellerini eklemek.',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
          ],
        ),
      ),
    );
  }
}