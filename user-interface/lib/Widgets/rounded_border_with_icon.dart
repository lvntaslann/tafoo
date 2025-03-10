import 'package:flutter/material.dart';

class RoundedBorderWithIcon extends StatelessWidget {
  const RoundedBorderWithIcon(
      {Key? key, required this.icon, this.width, this.height})
      : super(key: key);
  final IconData icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 40,
        height: height ?? 40,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color:Color.fromRGBO(192, 192, 192, 1.0),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 4, color: Color.fromRGBO(217, 217, 217, 1.0))),
        child: Center(child: Icon(icon, size: 25, color: Colors.white)));
  }
}