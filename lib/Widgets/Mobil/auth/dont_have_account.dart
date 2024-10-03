import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  final Function() onTap;
  const DontHaveAccount({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabın henüz yok mu?",
          style: TextStyle(
              color: Color(0XFF4B4B4B).withOpacity(0.4),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        GestureDetector(
            onTap: onTap,
            child: Text(
              "Kayıt ol",
              style:
                  TextStyle(color: Color(0XFF17517D), fontWeight: FontWeight.bold),
            ),),
      ],
    );
  }
}