import 'package:flutter/material.dart';

class LoginWithGoogleWidget extends StatelessWidget {
  final Function()? onTap;
  const LoginWithGoogleWidget({
    super.key,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 62,
        decoration: BoxDecoration(color: Color(0XFFB4B0B0),borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: Alignment.center,
          children:[ Container(
          width: 65,
          height: 52,
          decoration: BoxDecoration(color: Color(0XFFE8E6E6),borderRadius: BorderRadius.circular(10)),
            child: Image.asset("assets/images/googlelogo.png"),
          ),
          ]
        ),
      ),
    );
  }
}