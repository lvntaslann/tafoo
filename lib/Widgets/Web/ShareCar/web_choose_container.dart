import 'package:flutter/material.dart';

class WebChooseContainer extends StatelessWidget {
  const WebChooseContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 250),
      child: Container(
        width: size.width * 0.7,
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFFE8E6E6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "İlan bilgileri",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 93, 93, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 1,
                  width: 80,
                  color: Color(0xFFFE7F21),
                  margin: EdgeInsets.only(top: 4),
                ),
              ],
            ),
            SizedBox(width: 150),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Açıklama",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 93, 93, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(width: 150),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hizmetler",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 93, 93, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}