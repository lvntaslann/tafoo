import 'package:flutter/material.dart';

class AcceptShare extends StatelessWidget {
  const AcceptShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Image.asset(
        "assets/images/accept.png",
        width: 40,
        height: 40,
      ),
    );
  }
}