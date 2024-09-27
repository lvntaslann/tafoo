import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Image.asset("assets/images/place.png", width: 20, height: 20),
          Text(
            "Edirne/Merkez",
            style: TextStyle(
                color: Color(0XFF898989),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}