import 'package:flutter/material.dart';

class MyThirdTextWidget extends StatelessWidget {
  const MyThirdTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 45),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Son adım aracının\n',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
            TextSpan(
              text: 'görsellerini eklemek.',
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
