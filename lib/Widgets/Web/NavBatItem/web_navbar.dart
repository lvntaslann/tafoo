import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Web/NavBatItem/nav_button.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(color: Color(0XFFFE7F21)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Alırken, Satarken, Kullanırken!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: size.width * 0.4),
          WebNavButton(),
          SizedBox(
            width: size.width * 0.01,
          ),
          WebNavButton(),
          SizedBox(
            width: size.width * 0.01,
          ),
          WebNavButton(),
        ],
      ),
    );
  }
}