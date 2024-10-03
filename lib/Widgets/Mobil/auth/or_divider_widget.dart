import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Divider(
            thickness: 1.5,
            color: Color(0XFFBABABA),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "Ya da",
            style: TextStyle(
              color: Color(0XFF4B4B4B).withOpacity(0.4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Divider(
            thickness: 1.5,
            color: Color(0XFFBABABA),
          ),
        ),
      ],
    );
  }
}