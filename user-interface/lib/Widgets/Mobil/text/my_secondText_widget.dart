import 'package:flutter/material.dart';

class MySecondTextWidget extends StatelessWidget {
const MySecondTextWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 45),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'İnsanların,',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
            TextSpan(
              text: '%80i ',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF0000)),
            ),
                        TextSpan(
              text: 'araç\n',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
            TextSpan(
              text: 'özelliklerine önem\n',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E5D5D)),
            ),
              TextSpan(
              text: 'verir.',
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