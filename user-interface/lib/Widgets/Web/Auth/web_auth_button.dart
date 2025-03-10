import 'package:flutter/material.dart';

class WebAuthButton extends StatelessWidget {
  final Function() onTap;
  const WebAuthButton({
    super.key,
    required this.size, required this.onTap,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: size.height * 0.06,
        width: size.width * 0.1,
        decoration: BoxDecoration(
          color: Color(0XFF17517D),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: TextButton(
              onPressed: onTap,
              child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
                      ),
            )),
      );

  }
}