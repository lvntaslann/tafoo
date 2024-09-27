import 'package:flutter/material.dart';

class ShareDetail extends StatelessWidget {
  final String title;
  final String result;
  const ShareDetail({
    super.key, required this.title, required this.result,
  });

  //örnek olarak marka   bwm gibi bi düzen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title, 
              style: TextStyle(
                color: Color(0XFFBFBEBE),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              result,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0XFF898989),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}